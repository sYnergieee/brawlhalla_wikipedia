import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { ActivatedRoute, Params, Router } from '@angular/router';
import { PasswordChangeModel } from 'src/app/shared/models/user.model';
import { AuthService } from 'src/app/shared/services/auth.service';


@Component({
    selector: 'app-reset',
    templateUrl: './reset.component.html',
    styleUrls: ['./reset.component.scss', '../auth.component.scss']
})
export class ResetComponent implements OnInit {
    constructor(private _snackBar: MatSnackBar, private authService: AuthService, private router: Router, private route: ActivatedRoute) { }
    ngOnInit(): void {
        this.route.queryParams.subscribe((params: Params) => {
            if (params['code']) {
                this.key = params['code']
            }
        });
    }
    key: any
    hide = true;
    form = new FormGroup({
        password: new FormControl(null, [
            Validators.required, Validators.minLength(5)
        ]),
    });
    openSnackBar(message: string, action: string) {
        this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
    }
    changePassword() {
        const { password } = this.form.value;
        const data = new PasswordChangeModel(this.key, password)
        this.authService.changePassword(data).subscribe(
            (response: any) => {
                this.openSnackBar(response.message, 'OK')
                this.router.navigate(['/auth/login'])
            },
            (err) => {
                this.openSnackBar(err.error.detail, 'OK')
            }
        )
    }
    backToLogin(){
        this.router.navigate(['/auth/login'])
    }
}
