import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ApplicationPostModel } from 'src/app/shared/models/application.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-applications',
  templateUrl: './applications.component.html',
  styleUrls: ['./applications.component.scss']
})
export class ApplicationsComponent implements OnInit {
  constructor(private userService: UserService, private authService: AuthService, private _snackBar: MatSnackBar) { }
  appls: any;
  offset: number = 1
  LIMIT: number = 15
  user: any;
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  ngOnInit(): void {
    this.userService.GetApplicationsAll(this.LIMIT, null).subscribe(
      (res: any) => {
        this.appls = res.items
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
    text: new FormControl(null, [Validators.required]),
  });
  forwardOffset() {
    this.offset += 1
    this.userService.GetApplicationsAll(this.LIMIT, this.offset - 1).subscribe(
      (res: any) => {
        this.appls = res.items
      }
    )
  }
  backOffset() {
    this.offset -= 1
    this.userService.GetApplicationsAll(this.LIMIT, this.offset - 1).subscribe(
      (res: any) => {
        this.appls = res.items
      }
    )
  }
  addAppl() {
    const { text } = this.form.value
    const appl = new ApplicationPostModel(text)
    this.userService.PostApplication(appl).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.userService.GetApplicationsAll(this.LIMIT, this.offset - 1).subscribe(
          (res: any) => {
            this.appls = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.addAppl();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
  deleteAppl(id: number) {
    this.userService.DeleteApplication(id).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.userService.GetApplicationsAll(this.LIMIT, this.offset - 1).subscribe(
          (res: any) => {
            this.appls = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.deleteAppl(id);
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
}
