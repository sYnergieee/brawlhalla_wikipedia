import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { ChestPostModel, EventPostModel } from 'src/app/shared/models/event.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { SkinService } from 'src/app/shared/services/skin.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-events',
  templateUrl: './events.component.html',
  styleUrls: ['./events.component.scss']
})
export class EventsComponent implements OnInit {
  constructor(private skinService: SkinService, private router: Router, private _snackBar: MatSnackBar, private authService: AuthService, private userService: UserService) { }
  events: any
  chests: any
  user: any
  ngOnInit(): void {
    this.skinService.GetEventsAll().subscribe(
      (res: any) => {
        this.events = res.items
      }
    )
    this.skinService.GetChestsAll().subscribe(
      (res: any) => {
        this.chests = res.items
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
    name: new FormControl(null, [Validators.required]),
  });
  form_c = new FormGroup({
    name: new FormControl(null, [Validators.required]),
    img: new FormControl(null, [Validators.required]),
    cost: new FormControl(null, [Validators.required])
  });
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
  goToEventPage(id: number, is_chest: boolean) {
    this.router.navigate(['/system/event-full'], {
      queryParams: {
        id: id,
        is_chest: is_chest,
      },
    });
  }
  addChest() {
    const { name, img, cost } = this.form_c.value
    const chest = new ChestPostModel(name, img, cost)
    this.skinService.AddChest(chest).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.skinService.GetChestsAll().subscribe(
          (res: any) => {
            this.chests = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addChest();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
  addEvent() {
    const { name } = this.form.value
    const event = new EventPostModel(name)
    this.skinService.AddEvent(event).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.skinService.GetEventsAll().subscribe(
          (res: any) => {
            this.events = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addEvent();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
}
