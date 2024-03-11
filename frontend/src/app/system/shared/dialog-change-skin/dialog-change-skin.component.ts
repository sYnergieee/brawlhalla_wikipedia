import { Component, OnInit, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { ChestSkinPostPutModel, EventSkinPostPutModel } from 'src/app/shared/models/event.model';
import { SelectInput } from 'src/app/shared/models/input.model';
import { LegendWeaponPostModel } from 'src/app/shared/models/legend.model';
import { SkinPostModel, SkinPutModel } from 'src/app/shared/models/skin.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { LegendService } from 'src/app/shared/services/legend.service';
import { SkinService } from 'src/app/shared/services/skin.service';
import { UserService } from 'src/app/shared/services/user.service';

export interface DialogData {
  legend_id: any,
  weapon_id1: any,
  weapon_id2: any,
  id: any,
}

@Component({
  selector: 'app-dialog-change-skin',
  templateUrl: './dialog-change-skin.component.html',
  styleUrls: ['./dialog-change-skin.component.scss']
})
export class DialogChangeSkinComponent implements OnInit {
  constructor(public dialogRef: MatDialogRef<DialogChangeSkinComponent>, @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar, private userService: UserService, private authService: AuthService, private skinService: SkinService, private legendService: LegendService,
    private router: Router
  ) { }
  user: any;
  events: any;
  chests: any;
  weapons: any;
  skin: any;
  chest_load: any;
  event_load: any;
  ngOnInit(): void {
    console.log(this.data.legend_id, this.data.weapon_id1, this.data.weapon_id2, this.data.id)
    this.skinService.GetChestsAll().subscribe(
      (res: any) => {
        this.chests = res.items
        this.chest_load = true
      }
    )
    this.skinService.GetEventsAll().subscribe(
      (res: any) => {
        this.events = res.items
        this.event_load = true
      }
    )
    this.legendService.GetWeaponsAll().subscribe(
      (res: any) => {
        this.weapons = res.items
        this.weap1Input.icon = 'keyboard_arrow_down';
        this.weap1Input.values = this.compile_values('weapon1', this.weapons)
        this.weap2Input.icon = 'keyboard_arrow_down'
        this.weap2Input.values = this.compile_values('weapon2', this.weapons)
        this.form.controls['weapon1'].setValue(this.weapons.find((i: any) => i.id == this.data.weapon_id1).name)
        this.form.controls['weapon2'].setValue(this.weapons.find((i: any) => i.id == this.data.weapon_id2).name)
      }
    )
    if (this.data.id != null) {
      this.skinService.GetSkinById(this.data.id).subscribe(
        (res: any) => {
          this.skin = res
          this.form.controls['name'].setValue(res.name)
          this.form.controls['img'].setValue(res.img)
          this.form.controls['cost'].setValue(res.cost)

          if (res.is_exclusive == true) {
            this.exclusive_checked = this.exclusive[1]
          }
          if (res.is_crossover == true) {
            this.crossover_checked = this.crossover[1]
          }

          this.form.controls['name1'].setValue(res.weapons[0].name)
          this.form.controls['img1'].setValue(res.weapons[0].img)
          this.form.controls['name2'].setValue(res.weapons[1].name)
          this.form.controls['img2'].setValue(res.weapons[1].img)
          this.form.controls['purshase_info'].setValue(res.purshase_info.join('\n'))
          console.log(res.chests)
          if (this.event_load == true) {
            this.events.forEach((item: any) => {
              item.checked = res.events.some((i: any) => i.event_id == item.id);
            });
          }
          if (this.chest_load == true) {
            this.chests.forEach((item: any) => {
              item.checked = res.chests.some((i: any) => i.chest_id == item.id)
            })
          }


        }
      )
    }
  }


  form = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    img: new FormControl(null, [Validators.required]),
    cost: new FormControl(null),
    weapon1: new FormControl(null, [Validators.required]),
    name1: new FormControl(null, [Validators.required]),
    img1: new FormControl(null, [Validators.required]),
    weapon2: new FormControl(null, [Validators.required]),
    name2: new FormControl(null, [Validators.required]),
    img2: new FormControl(null, [Validators.required]),
    purshase_info: new FormControl(''),
  });

  exclusive: string[] = ['Not exclusive', 'Exclusive'];
  exclusive_checked = this.exclusive[0]
  crossover: string[] = ['Not crossover', 'Crossover'];
  crossover_checked = this.crossover[0]
  weap1Input: SelectInput = {
    field: 'weapon1',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form.get('weapon1')
  }
  weap2Input: SelectInput = {
    field: 'weapon2',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form.get('weapon2')
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


  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  onNoClick(): void {
    this.dialogRef.close();
  }
  processDataForSkin() {
    const { name, img, cost, weapon1, name1, img1, weapon2, name2, img2, purshase_info } = this.form.value
    let p_i: any[] = []
    if (purshase_info) {
      p_i = purshase_info.split('\n')
    }
    let weap_1 = this.weapons.find((i: any) => i.name == weapon1)
    let weap_2 = this.weapons.find((i: any) => i.name == weapon2)
    const chests_ids = this.pr(this.chests)
    const event_ids = this.pr(this.events)
    let is_exclusive = false
    let is_crossover = false
    if (this.exclusive_checked == 'Exclusive') {
      is_exclusive = true
    }
    if (this.crossover_checked == 'Crossover') {
      is_crossover = true
    }
    return {
      'name': name,
      'img': img,
      'cost': cost,
      'chest_ids': chests_ids,
      'event_ids': event_ids,
      'p_i': p_i,
      'weap1': weap_1.id,
      'name1': name1,
      'img1': img1,
      'weap2': weap_2.id,
      'name2': name2,
      'img2': img2,
      'is_exclusive': is_exclusive,
      'is_crossover': is_crossover
    }
  }
  addSkin() {
    const processedData = this.processDataForSkin()
    const weapons = [new LegendWeaponPostModel(processedData.weap1, processedData.name1, processedData.img1),
    new LegendWeaponPostModel(processedData.weap2, processedData.name2, processedData.img2)]
    let chests = []
    for (let i of processedData.chest_ids) {
      chests.push(new ChestSkinPostPutModel(i))
    }
    let events = []
    for (let i of processedData.event_ids) {
      events.push(new EventSkinPostPutModel(i))
    }
    const skin = new SkinPostModel(processedData.name, processedData.img, processedData.is_crossover, processedData.is_exclusive,
      processedData.cost, processedData.p_i, weapons, chests, events, this.data.legend_id)
    console.log(skin)
    this.skinService.PostSkin(skin).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addSkin();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
    this.dialogRef.close();
  }
  changeSkin() {
    const processedData = this.processDataForSkin()
    const weapons = [new LegendWeaponPostModel(processedData.weap1, processedData.name1, processedData.img1),
    new LegendWeaponPostModel(processedData.weap2, processedData.name2, processedData.img2)]
    let chests = []
    for (let i of processedData.chest_ids) {
      chests.push(new ChestSkinPostPutModel(i))
    }
    let events = []
    for (let i of processedData.event_ids) {
      events.push(new EventSkinPostPutModel(i))
    }
    const skin = new SkinPutModel(processedData.name, processedData.img, processedData.is_crossover, processedData.is_exclusive,
      processedData.cost, processedData.p_i, weapons, chests, events, this.data.id)
    this.skinService.PutSkin(skin).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addSkin();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
    this.dialogRef.close();
  }
}
