import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { LikeModel } from 'src/app/shared/models/review.model';
import { AuthService } from 'src/app/shared/services/auth.service';
import { FileService } from 'src/app/shared/services/file.service';
import { LegendService } from 'src/app/shared/services/legend.service';
import { UserService } from 'src/app/shared/services/user.service';
import { DialogChangeReviewComponent } from '../shared/dialog-change-review/dialog-change-review.component';
import { DialogChangeSkinComponent } from '../shared/dialog-change-skin/dialog-change-skin.component';
import { DialogChangeLegendComponent } from '../shared/dialog-change-legend/dialog-change-legend.component';

@Component({
  selector: 'app-legend-full',
  templateUrl: './legend-full.component.html',
  styleUrls: ['./legend-full.component.scss']
})
export class LegendFullComponent implements OnInit {
  constructor(private router: Router, private route: ActivatedRoute, private legendService: LegendService, private userService: UserService, private _snackBar: MatSnackBar, private authService: AuthService, private fileService: FileService, public dialog: MatDialog) { }
  legend: any;
  offset: number = 1
  GuideReviewControl = new FormControl('');
  GuideReview?: string = 'guide';
  reviews: any;
  user: any;
  LIMIT: number = 15;
  ngOnInit(): void {
    this.isInitialized = true
    this.route.queryParams.subscribe((params: Params) => {
      this.legendService.GetLegendById(params['id']).subscribe(
        (res: any) => {
          this.legend = res
          console.log(this.legend)
          this.userService.GetUserById(null).subscribe(
            (res: any) => {
              this.user = res
              this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
                (res: any) => {
                  this.reviews = res.items
                  console.log(this.reviews)
                }
              )
            },
            (err) => {
              if (err.error.detail == 'Token expired') {
                this.authService.refreshToken();
                this.ngOnInit();
              }
            }
          )
        }
      )
    });
  }
  getTypeIdReview(s: any) {
    if (s == 'guide') {
      return 2
    }
    else {
      return 1
    }
  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  sortBy() {
    return this.legend.stats.sort((a: any, b: any) => b.stat_id - a.stat_id);
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
      this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
        (res: any) => {
          this.reviews = res.items
          this.route.queryParams.subscribe((params: Params) => {
            this.legendService.GetLegendById(params['id']).subscribe(
              (res: any) => {
                this.legend.count_reviews.guide_type = res.count_reviews.guide_type
                this.legend.count_reviews.review_count = res.count_reviews.review_count
              })
          })
        },
        (err) => {
          if (err.error.detail == 'Token expired') {
            this.authService.refreshToken();
            dialogRef.afterClosed().subscribe(result => {
              this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
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
  openDialogSkin() {
    const dialogRef = this.dialog.open(DialogChangeSkinComponent, {
      data: {
        legend_id: this.legend.id,
        weapon_id1: this.legend.weapons[0].weapon_id,
        weapon_id2: this.legend.weapons[1].weapon_id,
      },
    });

    dialogRef.afterClosed().subscribe(result => {
      this.route.queryParams.subscribe((params: Params) => {
        this.legendService.GetLegendById(params['id']).subscribe(
          (res: any) => {
            this.legend = res
            console.log(this.legend)
          }
        )
      });
    });
  }
  openDialogLegend() {
    const dialogRef = this.dialog.open(DialogChangeLegendComponent, {
      data: { id: this.legend.id },
    });

    dialogRef.afterClosed().subscribe(result => {
      this.route.queryParams.subscribe((params: Params) => {
        this.legendService.GetLegendById(params['id']).subscribe(
          (res: any) => {
            this.legend = res
            console.log(this.legend)
          }
        )
      });
    });
  }
  isInitialized = false;
  getUserImage(id: number) {
    return this.fileService.GetUserImage(id)
  }
  forwardOffset() {
    this.offset += 1
    this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
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
    this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
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
  onValChange() {
    this.offset = 1
    this.userService.GetReviews(this.LIMIT, null, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
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
        this.userService.GetReviews(this.LIMIT, this.offset - 1, this.legend.id, null, this.getTypeIdReview(this.GuideReview)).subscribe(
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
  deleteLegend() {
    this.legendService.DeleteLegend(this.legend.id).subscribe(
      (res: any) => {
        this.openSnackBar(res.message, 'OK')
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.deleteLegend();
        }
        else {
          this.openSnackBar(err.error.detail, 'OK')
        }
      }
    )
    this.router.navigate(['/system/legends'])
  }
}
