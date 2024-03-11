import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { map, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { LegendPostModel, LegendStatPostModel, LegendWeaponPostModel } from 'src/app/shared/models/legend.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { LegendService } from 'src/app/shared/services/legend.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-legends',
  templateUrl: './legends.component.html',
  styleUrls: ['./legends.component.scss']
})
export class LegendsComponent implements OnInit {
  constructor(private legendService: LegendService, private router: Router, private userService: UserService, private authService: AuthService, private _snackBar: MatSnackBar) { }
  legends: any
  weapons: any
  user: any
  ngOnInit(): void {
    this.legendService.GetLegendsAllFull(null, null, null, null, null, null, null).subscribe(
      (res: any) => {
        this.legends = res.items
      }
    )
    this.legendService.GetWeaponsAll().subscribe(
      (res: any) => {
        this.weapons = res.items
        this.weap1Input.icon = 'keyboard_arrow_down';
        this.weap1Input.values = this.compile_values('weapon_id1', this.weapons)
        this.weap2Input.icon = 'keyboard_arrow_down'
        this.weap2Input.values = this.compile_values('weapon_id2', this.weapons)
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
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  form = new FormGroup({
    substr: new FormControl(null),
    cost: new FormControl(null),
    strength: new FormControl(null),
    dexterity: new FormControl(null),
    defense: new FormControl(null),
    speed: new FormControl(null),
  });
  form_add = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    aka_name: new FormControl(null, [Validators.required]),
    description: new FormControl(null, [Validators.required]),
    cost: new FormControl(null, [Validators.required]),
    img_main: new FormControl(null, [Validators.required]),
    img_short: new FormControl(null, [Validators.required]),
    release_info: new FormControl(null, [Validators.required]),
    weapon_id1: new FormControl(null, [Validators.required]),
    name1: new FormControl(null),
    img1: new FormControl(null),
    weapon_id2: new FormControl(null, [Validators.required]),
    name2: new FormControl(null),
    img2: new FormControl(null),
    value1: new FormControl(null, [Validators.required]),
    value2: new FormControl(null, [Validators.required]),
    value3: new FormControl(null, [Validators.required]),
    value4: new FormControl(null, [Validators.required]),
  })
  weap1Input: SelectInput = {
    field: 'weapon_id1',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form_add.get('weapon_id1')
  }
  weap2Input: SelectInput = {
    field: 'weapon_id2',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form_add.get('weapon_id2')
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
  pr(items: any[]) {
    return items
      .filter((item: any) => {
        return item.checked;
      })
      .map((i: any) => {
        return i.id;
      });
  }
  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  compile_values(name: string, arr: any[]) {
    return this.form_add.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
  applyFilter() {
    const { substr, cost, strength, dexterity, defense, speed } = this.form.value
    const weapon_ids = this.pr(this.weapons)
    let substr_ = substr
    if (substr && (substr == 'леха' || substr == 'xgero')) {
      //@ts-ignore
      substr_ = 'Arcadia'
    }
    if (substr && (substr == 'макс' || substr == 'synergie')) {
      //@ts-ignore
      substr_ = 'Wu shang'
    }
    if (substr && (substr == 'сыр' || substr == 'санек')) {
      //@ts-ignore
      substr_ = 'Queen Nai'
    }
    this.legendService.GetLegendsAllFull(substr_, weapon_ids, cost, strength, dexterity, defense, speed).subscribe(
      (res: any) => {
        this.legends = res.items
      }
    )
  }
  addLegend() {
    const { name, aka_name, description, cost, img_main, img_short, release_info,
      weapon_id1, name1, img1, weapon_id2, name2, img2, value1, value2, value3, value4 } = this.form_add.value
    let weap_1 = this.weapons.find((i: any) => i.name == weapon_id1)
    let weap_2 = this.weapons.find((i: any) => i.name == weapon_id2)
    const weapons = [new LegendWeaponPostModel(weap_1.id, name1, img1), new LegendWeaponPostModel(weap_2.id, name2, img2)]
    const stats = [new LegendStatPostModel(4, value1), new LegendStatPostModel(3, value2), new LegendStatPostModel(2, value3), new LegendStatPostModel(1, value4)]
    const legend = new LegendPostModel(name, aka_name, description, cost, img_main, img_short, release_info, weapons, stats)
    this.legendService.AddLegend(legend).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.legendService.GetLegendsAllFull(null, null, null, null, null, null, null).subscribe(
          (res: any) => {
            this.legends = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addLegend();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
  goToHeroPage(id: number) {
    this.router.navigate(['/system/legend-full'], {
      queryParams: {
        id: id
      },
    });
  }
}
