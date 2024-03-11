import { LiveAnnouncer } from '@angular/cdk/a11y';
import { Component, ElementRef, OnInit, ViewChild, inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { NgxCroppedEvent, NgxPhotoEditorService } from 'ngx-photo-editor';
import { AuthService } from 'src/app/shared/services/auth.service';
import { FileService } from 'src/app/shared/services/file.service';
import { UserService } from 'src/app/shared/services/user.service';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { LegendService } from 'src/app/shared/services/legend.service';
import { last, map, startWith } from 'rxjs';
import { MatChipInputEvent } from '@angular/material/chips';
import { MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';
import { UserPutModel } from 'src/app/shared/models/user.model';
import { LikeModel } from 'src/app/shared/models/review.model';
import { MatDialog } from '@angular/material/dialog';
import { DialogChangeReviewComponent } from '../shared/dialog-change-review/dialog-change-review.component';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.scss']
})
export class ProfileComponent implements OnInit {
  separatorKeysCodes: number[] = [ENTER, COMMA];
  fruitCtrl = new FormControl('');
  filteredFruits: any;
  fruits: any[] = [];
  allFruits: any[] = [];

  @ViewChild('fruitInput')
  fruitInput!: ElementRef<HTMLInputElement>;

  announcer = inject(LiveAnnouncer);

  constructor(private photoEditorService: NgxPhotoEditorService, private authService: AuthService, private userService: UserService, private _snackBar: MatSnackBar, private route: ActivatedRoute, private fileService: FileService, private legendService: LegendService, private router: Router,
    public dialog: MatDialog) { }
  user: any
  usr: any
  legends: any[] = []
  checker_for_admin: any
  checker_for_profile_self: any
  offset: number = 1
  GuideReviewControl = new FormControl('');
  GuideReview?: string = 'guide';
  reviews: any;
  LIMIT: number = 15;
  ngOnInit(): void {
    this.isInitialized = true
    this.legendService.GetLegendsAll().subscribe((items) => {
      this.get_tag_hidden(items);
    });
    this.route.queryParams.subscribe((params: Params) => {
      if (params['id']) {
        this.userService.GetUserById(params['id']).subscribe(
          (res: any) => {
            this.user = res
            this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
              (res: any) => {
                this.reviews = res.items
                console.log(this.reviews)
              }
            )
            this.userService.GetUserById(null).subscribe(
              (res: any) => {
                this.usr = res
                this.checker_for_admin = true ? (params['id'] && this.usr.role_id == 2) : false
                this.form.controls['nickname'].setValue(this.user.nickname)
                this.form.controls['email'].setValue(this.user.email)
                this.form.controls['firstname'].setValue(this.user.firstname)
                this.form.controls['lastname'].setValue(this.user.lastname)
                this.form.controls['telegram'].setValue(this.user.telegram)
                this.form.controls['discord'].setValue(this.user.discord)
              }
            )
            this.img = this.fileService.GetUserImage(this.user.id)
            for (let entry of this.user.favourites) {
              this.fruits.push(entry.legend)
            }
            console.log(this.user)
          },
          (err) => {
            if (err.error.detail == 'Token expired') {
              this.authService.refreshToken();
              this.ngOnInit();
            }
            else {
              this.openSnackBar(err.error.detail, 'OK')
            }
          }
        )
      }
      else {
        this.userService.GetUserById(null).subscribe(
          (res: any) => {
            this.user = res
            this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
              (res: any) => {
                this.reviews = res.items
                console.log(this.reviews)
              }
            )
            this.userService.GetUserById(null).subscribe(
              (res: any) => {
                this.usr = res
                this.checker_for_admin = true ? (params['id'] && this.usr.role_id == 2) : false
                this.form.controls['nickname'].setValue(this.user.nickname)
                this.form.controls['email'].setValue(this.user.email)
                this.form.controls['firstname'].setValue(this.user.firstname)
                this.form.controls['lastname'].setValue(this.user.lastname)
                this.form.controls['telegram'].setValue(this.user.telegram)
                this.form.controls['discord'].setValue(this.user.discord)
              }
            )
            this.img = this.fileService.GetUserImage(this.user.id)
            console.log(this.user)
            for (let entry of this.user.favourites) {
              this.fruits.push(entry.legend)
            }
          },
          (err) => {
            if (err.error.detail == 'Token expired') {
              this.authService.refreshToken();
              this.ngOnInit();
            }
            else {
              this.openSnackBar(err.error.detail, 'OK')
            }
          }
        )
      }
      this.checker_for_profile_self = true ? params['id'] : false
    });
  }


  form = new FormGroup({
    nickname: new FormControl(null, [Validators.required]),
    email: new FormControl(null, [Validators.required, Validators.email]),
    firstname: new FormControl(null),
    lastname: new FormControl(null),
    password: new FormControl(null),
    telegram: new FormControl(null),
    discord: new FormControl(null)
  });
  hide = true;
  getErrorMessage() {
    if (this.form.controls['email'].hasError('required')) {
      return 'Email required';
    }

    return this.form.controls['email'].hasError('email')
      ? 'Incorrect email'
      : '';
  }


  get_tag_hidden(result: any) {
    this.allFruits = result.items;
    this.filteredFruits = this.compile_values(this.allFruits, this.fruitCtrl);
  }

  compile_values(arr: any[], form: any) {
    return form.valueChanges.pipe(
      startWith(null),
      map((item: any) => (item ? this._filterValues(item, arr) : arr.slice()))
    );
  }
  private _filterValues(value: string, values: any[]) {
    const filterValue = value.toLowerCase();
    return values.filter((fruit) =>
      fruit.name.toLowerCase().includes(filterValue)
    );
  }
  add(event: MatChipInputEvent): void {
    const value = (event.value || '').trim();
    // Add our fruit
    if (value) {
      this.fruits.push(value);
    }
    // Clear the input value
    event.chipInput!.clear();

    this.fruitCtrl.setValue(null);
  }

  remove(fruit: any): void {
    this.fruits.splice(
      this.fruits.findIndex((v) => v.name === fruit.name),
      1
    );
    this.legends.splice(
      this.legends.findIndex((v: any) => v === fruit.id),
      1
    );
    this.announcer.announce(`Removed ${fruit}`);
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    let value = event.option.viewValue;
    let arr = this._filterValues(value, this.allFruits);
    let obj = arr.filter((fruit) => fruit.name == value)[0];
    this.fruits.push(obj);
    this.legends.push(obj.id);
    this.fruitInput.nativeElement.value = '';
    this.fruitCtrl.setValue(null);

  }

  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  output?: NgxCroppedEvent;
  img: any
  onOpenFileDialog(id: string) {
    this.route.queryParams.subscribe((params: Params) => {
      if (!params['id']) {
        document.getElementById(id)?.click();
      }
    })

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
  displayImg() {
    if (this.output) return this.output.base64;
    else return this.img
  }
  fileImgChange(event: any) {
    this.output = undefined;
    this.photoEditorService
      .open(event, {
        modalMaxWidth: 'min(95%, 400px)',
        modalTitle: 'Photo on your page',
        applyBtnText: "Save and continue",
        closeBtnText: "Go back",
        aspectRatio: 1 / 1,
        autoCropArea: 1,
      })
      .subscribe((data) => {
        this.output = data;
        if (this.output) {
          this.fileService.UploadImageUser(this.output.file);
        }
      },
        (err) => {
          console.log(err.error.detail);
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            this.ngOnInit()
            this.fileImgChange(event)
          }
          else {
            this.openSnackBar(err.error.detail, 'OK')
          }
        });
  }
  changeUser() {
    let favourites_ids: any[] = []
    for (let entry of this.fruits) {
      favourites_ids.push(entry.id)
    }
    console.log(favourites_ids)
    const { nickname, email, firstname, lastname, telegram, discord, password } = this.form.value
    const user = new UserPutModel(this.usr.id, nickname, email, password, firstname, lastname, telegram, discord, this.usr.role.id)
    console.log(user)
    this.userService.PutUser(user).subscribe(
      (res: any) => {
        this.userService.PostFavourite(favourites_ids).subscribe(
          (res: any) => {
            this.openSnackBar('User successfully changed!', 'OK')
          },
          (err) => {
            this.openSnackBar(err.error.detail, 'OK')
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.changeUser();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
  upgradeToAdmin() {
    const { nickname, email, firstname, lastname, telegram, discord, password } = this.form.value
    const user = new UserPutModel(this.user.id, nickname, email, password, firstname, lastname, telegram, discord, 2)
    console.log(user)
    this.userService.PutUser(user).subscribe(
      (res: any) => {
        this.openSnackBar('User successfully changed!', 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.changeUser();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }
  deleteUser() {
    this.userService.DeleteUser().subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.authService.deleteTokens()
        this.router.navigate(['/auth/login'])
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.deleteUser();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
  }

  getTypeIdReview(s: any) {
    if (s == 'guide') {
      return 2
    }
    else {
      return 1
    }
  }
  goToEventPage(id: number, is_chest: boolean) {
    this.router.navigate(['/system/event-full'], {
      queryParams: {
        id: id,
        is_chest: is_chest,
      },
    });
  }
  openDialog(id: any, mark: any, text: any, type_id: any, legend_id: any) {
    const dialogRef = this.dialog.open(DialogChangeReviewComponent, {
      data: { id: id, mark: mark, text: text, type_id: type_id, legend_id: legend_id },
    });

    dialogRef.afterClosed().subscribe(result => {
      this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
        (res: any) => {
          this.reviews = res.items
        },
        (err) => {
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            dialogRef.afterClosed().subscribe(result => {
              this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
                (res: any) => {
                  this.reviews = res.items
                }
              )
            });
          }
        }
      )
    });
  }
  isInitialized = false;
  getUserImage(id: number) {
    return this.fileService.GetUserImage(id)
  }
  forwardOffset() {
    this.offset += 1
    this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
      (res: any) => {
        this.reviews = res.items
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.offset -= 1;
          this.forwardOffset();
        }
      }
    )
  }
  backOffset() {
    this.offset -= 1
    this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
      (res: any) => {
        this.reviews = res.items
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.offset += 1;
          this.backOffset();
        }
      }
    )
  }
  goToFullSkinPage(id: number) {
    this.router.navigate(['system/skin-full'], {
      queryParams: {
        id: id,
      },
    })
  }
  onValChange() {
    this.offset = 1
    this.userService.GetReviews(this.LIMIT, null, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
      (res: any) => {
        this.reviews = res.items
        console.log(this.reviews)
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.onValChange();
        }
      }
    )
  }
  likeReview(id: number) {
    const like = new LikeModel(id)
    this.userService.PostLike(like).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
        this.userService.GetReviews(this.LIMIT, this.offset - 1, null, this.user.id, this.getTypeIdReview(this.GuideReview)).subscribe(
          (res: any) => {
            this.reviews = res.items
          }
        )
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.likeReview(id);
        }
      }
    )
  }

}
