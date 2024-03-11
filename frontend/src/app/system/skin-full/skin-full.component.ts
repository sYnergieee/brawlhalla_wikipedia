import { Component, OnInit } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { AuthService } from 'src/app/shared/services/auth.service';
import { SkinService } from 'src/app/shared/services/skin.service';
import { UserService } from 'src/app/shared/services/user.service';
import { DialogChangeSkinComponent } from '../shared/dialog-change-skin/dialog-change-skin.component';

@Component({
  selector: 'app-skin-full',
  templateUrl: './skin-full.component.html',
  styleUrls: ['./skin-full.component.scss']
})
export class SkinFullComponent implements OnInit {
  constructor(private authService: AuthService, private userService: UserService, private skinService: SkinService, private _snackBar: MatSnackBar, private route: ActivatedRoute, private router: Router, public dialog: MatDialog) { }
  skin: any;
  user: any;
  ngOnInit(): void {
    this.route.queryParams.subscribe((params: Params) => {
      this.skinService.GetSkinById(params['id']).subscribe(
        (res: any) => {
          this.skin = res
          console.log(this.skin)
        }
      )
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
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
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
  goToEventPage(id: number, is_chest: boolean) {
    this.router.navigate(['/system/event-full'], {
      queryParams: {
        id: id,
        is_chest: is_chest,
      },
    });
  }
  openDialogSkin() {
    const dialogRef = this.dialog.open(DialogChangeSkinComponent, {
      data: {
        id: this.skin.id,
        weapon_id1: this.skin.weapons[0].weapon_id,
        weapon_id2: this.skin.weapons[1].weapon_id,
      },
    });

    dialogRef.afterClosed().subscribe(result => {
      this.route.queryParams.subscribe((params: Params) => {
        this.skinService.GetSkinById(params['id']).subscribe(
          (res: any) => {
            this.skin = res
            console.log(this.skin)
          }
        )
      })
    });
  }
  deleteSkin() {
    this.route.queryParams.subscribe((params: Params) => {
      this.skinService.DeleteSkinById(params['id']).subscribe(
        (res: any) => {
          this.openSnackBar(res.message, 'OK')
        },
        (err) => {
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            this.deleteSkin();
          }
          else {
            this.openSnackBar(err.error.detail, 'OK')
          }
        }
      )
      this.router.navigate(['/system/legend-full'], {
        queryParams: {
          id: this.skin.legend_id,
        },
      }).then(() => {
        window.location.reload();
      });
    })

  }
}
