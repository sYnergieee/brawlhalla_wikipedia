import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { map, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { LegendService } from 'src/app/shared/services/legend.service';
import { SkinService } from 'src/app/shared/services/skin.service';

@Component({
  selector: 'app-skins',
  templateUrl: './skins.component.html',
  styleUrls: ['./skins.component.scss']
})
export class SkinsComponent implements OnInit {
  constructor(private skinService: SkinService, private legendService: LegendService, private router: Router) { }
  offset: number = 1
  skins: any;
  legends: any;
  chests: any;
  events: any;
  LIMIT: number = 15
  ngOnInit(): void {
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
    this.legendService.GetLegendsAll().subscribe(
      (res: any) => {
        this.legends = res.items
        this.legendInput.icon = 'keyboard_arrow_down';
        this.legendInput.values = this.compile_values('legend', this.legends)
      }
    )
    this.skinService.GetSkinsAll(this.LIMIT, null, null, null, null, null, null, null).subscribe(
      (res: any) => {
        this.skins = res.items
      }
    )
  }

  exclusive: string[] = ['No filter', 'Exclusive', 'Not exclusive'];
  exclusive_checked = this.exclusive[0]
  form = new FormGroup({
    substr: new FormControl(null),
    legend: new FormControl(null),
  });
  crossover: string[] = ['No filter', 'Crossover', 'Not crossover'];
  crossover_checked = this.crossover[0]
  legendInput: SelectInput = {
    field: 'legend',
    type: 'text',
    label: 'Loading legends...',
    formControl: this.form.get('legend')
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
    let is_exclusive = null
    let is_crossover = null
    if (this.exclusive_checked == 'Exclusive') {
      is_exclusive = true
    }
    else if (this.exclusive_checked == 'Not exclusive') {
      is_exclusive = false
    }
    if (this.crossover_checked == 'Crossover') {
      is_crossover = true
    }
    else if (this.crossover_checked == 'Not crossover') {
      is_crossover = false
    }
    this.skinService.GetSkinsAll(this.LIMIT, this.offset - 1, substr, leg, is_exclusive, is_crossover, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.skins = res.items
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
    let is_exclusive = null
    let is_crossover = null
    if (this.exclusive_checked == 'Exclusive') {
      is_exclusive = true
    }
    else if (this.exclusive_checked == 'Not exclusive') {
      is_exclusive = false
    }
    if (this.crossover_checked == 'Crossover') {
      is_crossover = true
    }
    else if (this.crossover_checked == 'Not crossover') {
      is_crossover = false
    }
    this.skinService.GetSkinsAll(this.LIMIT, this.offset - 1, substr, leg, is_exclusive, is_crossover, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.skins = res.items
      }
    )
  }
  getImage(url: any) {
    let concUrl = ''
    if (url.lastIndexOf('.png') > -1){
      concUrl = url.substring(0, url.lastIndexOf('.png') + 4);
    }
    if (url.lastIndexOf('.gif') > -1){
      concUrl = url.substring(0, url.lastIndexOf('.gif') + 4);
    }
    return concUrl
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
    let is_exclusive = null
    let is_crossover = null
    if (this.exclusive_checked == 'Exclusive') {
      is_exclusive = true
    }
    else if (this.exclusive_checked == 'Not exclusive') {
      is_exclusive = false
    }
    if (this.crossover_checked == 'Crossover') {
      is_crossover = true
    }
    else if (this.crossover_checked == 'Not crossover') {
      is_crossover = false
    }
    this.offset = 1
    this.skinService.GetSkinsAll(this.LIMIT, null, substr, leg, is_exclusive, is_crossover, event_ids, chests_ids).subscribe(
      (res: any) => {
        this.skins = res.items
      }
    )
  }
  goToEventPage(id: number, is_chest: boolean){
    this.router.navigate(['/system/event-full'], {
      queryParams: {
        id: id,
        is_chest: is_chest,
      },
    });
  }
  goToFullSkinPage(id: number){
    this.router.navigate(['system/skin-full'], {
      queryParams: {
        id: id,
      },
    })
  }
}
