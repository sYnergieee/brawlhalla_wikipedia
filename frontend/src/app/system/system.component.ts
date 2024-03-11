import { Component, OnInit } from '@angular/core';
import { LINKS } from '../shared/consts';

@Component({
  selector: 'app-system',
  templateUrl: './system.component.html',
  styleUrls: ['./system.component.scss']
})
export class SystemComponent implements OnInit{
  mode: any = 'over';
  hasBackdrop: any = true;
  constructor() {}
  usr: any
  links = LINKS;
  ngOnInit() {
  }

  drawerColor(flag: boolean) {
    if (flag) {
      return { color: "#9400d3"};
    }
    return {};
  }
}
