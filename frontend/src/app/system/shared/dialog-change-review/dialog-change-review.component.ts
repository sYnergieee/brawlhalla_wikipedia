import { Component, OnInit, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Observable, map, of, startWith } from 'rxjs';
import { ReviewPostModel, ReviewPutModel } from 'src/app/shared/models/review.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { UserService } from 'src/app/shared/services/user.service';

export interface DialogData {
  id: any,
  mark: any,
  text: any,
  type_id: any,
  legend_id: any,
}

@Component({
  selector: 'app-dialog-change-review',
  templateUrl: './dialog-change-review.component.html',
  styleUrls: ['./dialog-change-review.component.scss']
})
export class DialogChangeReviewComponent implements OnInit {
  constructor(public dialogRef: MatDialogRef<DialogChangeReviewComponent>, @Inject(MAT_DIALOG_DATA) public data: DialogData,
    private _snackBar: MatSnackBar, private userService: UserService, private authService: AuthService,
  ) { }
  user: any;
  ngOnInit(): void {
    console.log(this.data.id, this.data.mark, this.data.text, this.data.type_id, this.data.legend_id)
    this.form.controls['text'].setValue(this.data.text)
    this.form.controls['mark'].setValue(this.data.mark)
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
    mark: new FormControl(null),
  });
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  onNoClick(): void {
    this.dialogRef.close();
  }
  sendReview() {
    const {text, mark} = this.form.value
    if (this.data.legend_id != null) {
      const review = new ReviewPostModel(text, mark, this.data.legend_id, this.data.type_id)
      this.userService.PostReview(review).subscribe(
        (res: any) => {
          this.openSnackBar(res.message, 'OK')
        },
        (err) => {
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            this.sendReview();
          }
          else {
            this.openSnackBar(err.error.detail, 'OK')
          }
        }
      )
    }
    else {
      const review = new ReviewPutModel(text, mark, this.data.id)
      this.userService.PutReview(review).subscribe(
        (res: any) => {
          this.openSnackBar(res.message, 'OK')
        },
        (err) => {
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            this.sendReview();
          }
          else {
            this.openSnackBar(err.error.detail, 'OK')
          }
        }
      )
    }
    this.dialogRef.close();
  }
  delReview() {
    this.userService.DeleteReview(this.data.id).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.delReview();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
    this.dialogRef.close();
  }
}
