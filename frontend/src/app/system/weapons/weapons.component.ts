import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { map, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { WeaponPostModel } from 'src/app/shared/models/legend.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { LegendService } from 'src/app/shared/services/legend.service';
import { SkinService } from 'src/app/shared/services/skin.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-weapons',
  templateUrl: './weapons.component.html',
  styleUrls: ['./weapons.component.scss']
})
export class WeaponsComponent implements OnInit {
  constructor(private legendService: LegendService, private router: Router, private skinService: SkinService, private _snackBar: MatSnackBar, private authService: AuthService, private userService: UserService) { }
  offset: number = 1
  weapons: any;
  weapon_types: any;
  legends: any;
  chests: any;
  events: any;
  user: any;
  LIMIT: number = 15
  ngOnInit(): void {
    this.legendService.GetWeaponSkinsAll(this.LIMIT, null, null, null, null, null, null).subscribe(
      (res: any) => {
        this.weapons = res.items
      }
    )
    this.legendService.GetLegendsAll().subscribe(
      (res: any) => {
        this.legends = res.items
        this.legendInput.icon = 'keyboard_arrow_down';
        this.legendInput.values = this.compile_values('legend', this.legends)
      }
    )
    this.legendService.GetWeaponsAll().subscribe(
      (res: any) => {
        this.weapon_types = res.items
      }
    )
    this.skinService.GetChestsAll().subscribe(
      (res: any) => {
        this.chests = res.items
      }
    )
    this.skinService.GetEventsAll().subscribe(
      (res: any) => {
        this.events = res.items
      }
    )
    this.userService.GetUserById(null).subscribe(
      (res: any) => {
        this.user = res
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.ngOnInit();
        }
      }
    )
  }
  form = new FormGroup({
    substr: new FormControl(null),
    legend: new FormControl(null),
  });
  form_add = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    img: new FormControl(null, [Validators.required]),
  })
  legendInput: SelectInput = {
    field: 'legend',
    type: 'text',
    label: 'Loading legends...',
    formControl: this.form.get('legend')
  }
  forwardOffset() {
    this.offset += 1
    const { substr, legend } = this.form.value
    let leg = null
    if (legend != null) {
      leg = this.legends.find((i: any) => i.name == legend)
      if (leg) {
        leg = leg.id
      }
    }
    const chests_ids = this.pr(this.chests)
    const event_ids = this.pr(this.events)
    const weapon_type_ids = this.pr(this.weapon_types)
    this.legendService.GetWeaponSkinsAll(this.LIMIT, this.offset - 1, substr, weapon_type_ids, leg, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.weapons = res.items
      }
    )
  }
  backOffset() {
    this.offset -= 1
    const { substr, legend } = this.form.value
    let leg = null
    if (legend != null) {
      leg = this.legends.find((i: any) => i.name == legend)
      if (leg) {
        leg = leg.id
      }
    }
    const chests_ids = this.pr(this.chests)
    const event_ids = this.pr(this.events)
    const weapon_type_ids = this.pr(this.weapon_types)
    this.legendService.GetWeaponSkinsAll(this.LIMIT, this.offset - 1, substr, weapon_type_ids, leg, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.weapons = res.items
      }
    )
  }
  getImage(url: any) {
    let concUrl = ''
    if (url.lastIndexOf('.png') > -1) {
      concUrl = url.substring(0, url.lastIndexOf('.png') + 4);
    }
    if (url.lastIndexOf('.gif') > -1) {
      concUrl = url.substring(0, url.lastIndexOf('.gif') + 4);
    }
    return concUrl
  }
  goToSkinPage(id: number) {
    this.router.navigate(['/system/skin-full'], {
      queryParams: {
        id: id
      },
    });
  }
  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
  pr(items: any[]) {
    return items
      .filter((item: any) => {
        return item.checked;
      })
      .map((i: any) => {
        return i.id;
      });
  }
  applyFilter() {
    const { substr, legend } = this.form.value
    let leg = null
    if (legend != null) {
      leg = this.legends.find((i: any) => i.name == legend)
      if (leg) {
        leg = leg.id
      }
    }
    const chests_ids = this.pr(this.chests)
    const event_ids = this.pr(this.events)
    const weapon_type_ids = this.pr(this.weapon_types)
    this.offset = 1
    this.legendService.GetWeaponSkinsAll(this.LIMIT, null, substr, weapon_type_ids, leg, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.weapons = res.items
      }
    )
  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  addWeapon() {
    const { name, img } = this.form_add.value
    const weapon = new WeaponPostModel(name, img)
    this.legendService.AddWeapon(weapon).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.legendService.GetWeaponsAll().subscribe(
          (res: any) => {
            this.weapon_types = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addWeapon();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
}
