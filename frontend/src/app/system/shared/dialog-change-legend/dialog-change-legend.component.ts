import { Component, OnInit, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { Observable, map, of, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { LegendPutModel, LegendStatPostModel, LegendWeaponPostModel } from 'src/app/shared/models/legend.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { LegendService } from 'src/app/shared/services/legend.service';
import { UserService } from 'src/app/shared/services/user.service';

export interface DialogData {
  id: any,
}

@Component({
  selector: 'app-dialog-change-legend',
  templateUrl: './dialog-change-legend.component.html',
  styleUrls: ['./dialog-change-legend.component.scss']
})
export class DialogChangeLegendComponent implements OnInit {
  constructor(public dialogRef: MatDialogRef<DialogChangeLegendComponent>, @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar, private userService: UserService, private authService: AuthService, private legendService: LegendService,
    private router: Router
  ) { }
  user: any;
  weapons: any;
  legend: any;
  ngOnInit(): void {
    this.legendService.GetLegendById(this.data.id).subscribe(
      (res: any) => {
        this.legend = res
        console.log(this.legend)
        this.legend.stats = this.legend.stats.sort((a: any, b: any) => b.stat_id - a.stat_id);
        this.form.controls['name'].setValue(this.legend.name)
        this.form.controls['aka_name'].setValue(this.legend.aka_name)
        this.form.controls['description'].setValue(this.legend.description)
        this.form.controls['cost'].setValue(this.legend.cost)
        this.form.controls['img_main'].setValue(this.legend.img_main)
        this.form.controls['img_short'].setValue(this.legend.img_short)
        this.form.controls['release_info'].setValue(this.legend.release_info)
        this.form.controls['name1'].setValue(this.legend.weapons[0].name)
        this.form.controls['img1'].setValue(this.legend.weapons[0].img)
        this.form.controls['name2'].setValue(this.legend.weapons[1].name)
        this.form.controls['img2'].setValue(this.legend.weapons[1].img)
        this.form.controls['value1'].setValue(this.legend.stats[0].value)
        this.form.controls['value2'].setValue(this.legend.stats[1].value)
        this.form.controls['value3'].setValue(this.legend.stats[2].value)
        this.form.controls['value4'].setValue(this.legend.stats[3].value)

        this.legendService.GetWeaponsAll().subscribe(
          (res: any) => {
            this.weapons = res.items
            this.weap1Input.icon = 'keyboard_arrow_down';
            this.weap1Input.values = this.compile_values('weapon_id1', this.weapons)
            this.weap2Input.icon = 'keyboard_arrow_down'
            this.weap2Input.values = this.compile_values('weapon_id2', this.weapons)
            this.form.controls['weapon_id1'].setValue(this.weapons.find((i: any) => i.id == this.legend.weapons[0].weapon_id).name)
            this.form.controls['weapon_id2'].setValue(this.weapons.find((i: any) => i.id == this.legend.weapons[1].weapon_id).name)
          }
        )
      }
    )
  }
  form = new FormGroup({
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
  });
  weap1Input: SelectInput = {
    field: 'weapon_id1',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form.get('weapon_id1')
  }
  weap2Input: SelectInput = {
    field: 'weapon_id2',
    type: 'text',
    label: 'Loading weapons...',
    formControl: this.form.get('weapon_id2')
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
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  onNoClick(): void {
    this.dialogRef.close();
  }
  changeLegend() {
    console.log(this.data.id)
    const { name, aka_name, description, cost, img_main, img_short, release_info,
      weapon_id1, name1, img1, weapon_id2, name2, img2, value1, value2, value3, value4 } = this.form.value
    let weap_1 = this.weapons.find((i: any) => i.name == weapon_id1)
    let weap_2 = this.weapons.find((i: any) => i.name == weapon_id2)
    const weapons = [new LegendWeaponPostModel(weap_1.id, name1, img1), new LegendWeaponPostModel(weap_2.id, name2, img2)]
    const stats = [new LegendStatPostModel(4, value1), new LegendStatPostModel(3, value2), new LegendStatPostModel(2, value3), new LegendStatPostModel(1, value4)]
    const legend = new LegendPutModel(name, aka_name, description, cost, img_main, img_short, release_info, weapons, stats, this.data.id)
    this.legendService.PutLegend(legend).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.changeLegend();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
    this.dialogRef.close();
  }
}
