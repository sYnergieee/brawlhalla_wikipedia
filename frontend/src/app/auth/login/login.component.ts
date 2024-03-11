import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormGroupDirective, NgForm, Validators } from '@angular/forms';
import { ErrorStateMatcher } from '@angular/material/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { PasswordRestoreModel, SignInModel, SignUpModel } from 'src/app/shared/models/user.model';
import { AuthService } from 'src/app/shared/services/auth.service';

export class MyErrorStateMatcher implements ErrorStateMatcher {
  isErrorState(control: FormControl | null, form: FormGroupDirective | NgForm | null): boolean {
    const isSubmitted = form && form.submitted;
    return !!(control && control.invalid && (control.dirty || control.touched || isSubmitted));
  }
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss', '../auth.component.scss']
})
export class LoginComponent implements OnInit {
  constructor(private _snackBar: MatSnackBar, private authService: AuthService, private router: Router) { }
  ngOnInit(): void {

  }
  openSnackBar(message: string, action: string) {
    this._snackBar.open(message, action, { horizontalPosition: 'center', verticalPosition: 'top', duration: 5000 });
  }
  hide = true;
  hide1 = true;
  form = new FormGroup({
    email: new FormControl(null, [Validators.required, Validators.email]),
    password: new FormControl(null, [
      Validators.required,
    ]),
  });
  form_reg = new FormGroup({
    email: new FormControl(null, [Validators.required, Validators.email]),
    password: new FormControl(null, [
      Validators.required,
    ]),
    firstname: new FormControl(null, [Validators.required]),
  });
  getErrorMessage() {
    if (this.form.controls['email'].hasError('required')) {
      return 'Email required';
    }

    return this.form.controls['email'].hasError('email')
      ? 'Incorrect email'
      : '';
  }
  access_token: string = '';
  refresh_token: string = '';
  signin() {
    const { email, password } = this.form.value;
    const user = new SignInModel(email, password);
    this.authService.login(user).subscribe(
      (response: any) => {
        this.access_token = response['access_token']
        this.refresh_token = response['refresh_token']
        window.localStorage.setItem('access_token', this.access_token);
        window.localStorage.setItem('refresh_token', this.refresh_token);
        this.openSnackBar('You have successfully logged!', 'OK')
        this.router.navigate(['/system/profile'])
      },
      (err) => {
        if (typeof err.error.detail != 'string') {
          this.openSnackBar('User not exist', 'OK')
        }
        else this.openSnackBar(err.error.detail, 'OK')
      }
    )
  }
  signup() {
    const { email, password, firstname } = this.form_reg.value
    const user = new SignUpModel(email, password, firstname)
    this.authService.register(user).subscribe(
      (response: any) => {
        this.access_token = response['access_token']
        this.refresh_token = response['refresh_token']
        window.localStorage.setItem('access_token', this.access_token);
        window.localStorage.setItem('refresh_token', this.refresh_token);
        this.openSnackBar('You have successfully registered!', 'OK')
        this.router.navigate(['/system/profile'])
      },
      (err) => {
        if (typeof err.error.detail != 'string') {
          this.openSnackBar('Invalid data', 'OK')
        }
        else this.openSnackBar(err.error.detail, 'OK')
      }
    )
  }
  sendEmail() {
    const { email, password } = this.form.value;
    const data = new PasswordRestoreModel(email)
    this.authService.restorePassword(data).subscribe(
      (response: any) => {
        this.openSnackBar(response.message, 'OK')
      },
      (err) => {
        if (typeof err.error.detail != 'string') {
          this.openSnackBar('Invalid email', 'OK')
        }
        else this.openSnackBar(err.error.detail, 'OK')
      }
    )
  }
}
