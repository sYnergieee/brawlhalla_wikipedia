import { Component, OnInit } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { ChestSkinModel, EventSkinModel } from 'src/app/shared/models/event.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { SkinService } from 'src/app/shared/services/skin.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-event-full',
  templateUrl: './event-full.component.html',
  styleUrls: ['./event-full.component.scss']
})
export class EventFullComponent implements OnInit {
  constructor(private router: Router, private route: ActivatedRoute, private skinService: SkinService, private userService: UserService, private authService: AuthService, private _snackBar: MatSnackBar) { }
  event: any;
  user: any;
  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      if (params['is_chest'] == 'true') {
        this.skinService.GetChestById(params['id']).subscribe(
          (res: any) => {
            this.event = res
          }
        )
      }
      else if (params['is_chest'] == 'false') {
        this.skinService.GetEventById(params['id']).subscribe(
          (res: any) => {
            this.event = res
          }
        )
      }
    });
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
  goToFullSkinPage(id: number) {
    this.router.navigate(['system/skin-full'], {
      queryParams: {
        id: id,
      },
    })
  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  deleteFromEventChest(skin_id: number) {
    this.route.queryParams.subscribe((params: Params) => {
      if (params['is_chest'] == 'true') {
        const chest_skin = new ChestSkinModel(params['id'], skin_id)
        this.skinService.DeleteChestSkin(chest_skin).subscribe(
          (res: any) => {
            this.openSnackBar(res.message, 'OK')
            this.skinService.GetChestById(params['id']).subscribe(
              (res: any) => {
                this.event = res
              }
            )
          },
          (err) => {
            if (err.error.detail == 'Token expired') {
              this.authService.refreshToken();
              this.deleteFromEventChest(skin_id);
            }
            else {
              this.openSnackBar(err.error.detail, 'OK')
            }
          }
        )
      }
      else if (params['is_chest'] == 'false') {
        const event_skin = new EventSkinModel(params['id'], skin_id)
        this.skinService.DeleteEventSkin(event_skin).subscribe(
          (res: any) => {
            this.openSnackBar(res.message, 'OK')
            this.skinService.GetEventById(params['id']).subscribe(
              (res: any) => {
                this.event = res
              }
            )
          },
          (err) => {
            if (err.error.detail == 'Token expired') {
              this.authService.refreshToken();
              this.deleteFromEventChest(skin_id);
            }
            else {
              this.openSnackBar(err.error.detail, 'OK')
            }
          }
        )
      }
    })
  }
}
