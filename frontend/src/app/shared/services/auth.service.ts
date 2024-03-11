import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment';
import { PasswordChangeModel, PasswordRestoreModel, SignInModel, SignUpModel } from '../models/user.model';
import { Observable, catchError } from 'rxjs';
import { handleError } from '../handle_error';

const URL = `${environment.BACKEND_URL}/auth`;


@Injectable({
    providedIn: 'root',
})
export class AuthService {
    constructor(private http: HttpClient, private router: Router) { }
    login(user: SignInModel): Observable<Object> {
        const form = new FormData()
        form.append('username', user.username)
        form.append('password', user.password)
        return this.http.post(URL + '/signin', form).pipe(catchError(handleError));
    }
    register(user: SignUpModel): Observable<Object> {
        return this.http.post(URL + '/signup', user).pipe(catchError(handleError))
    }
    getAccessToken() {
        return window.localStorage.getItem('access_token')
    }
    deleteTokens() {
        window.localStorage.clear()
    }
    refreshToken() {
        let token = window.localStorage.getItem('refresh_token')
        return this.http.post(URL + '/refresh_token', '', {
            headers: { Authorization: `Bearer ${token}` },
        })
            .pipe(catchError(handleError))
            .subscribe(
                (response: any) => {
                    window.localStorage.setItem('access_token', response['access_token']);
                    window.localStorage.setItem('refresh_token', response['refresh_token']);
                },
                (err) => {
                    this.router.navigate(['auth/login'])
                    this.deleteTokens()
                }
            )
    }
    restorePassword(data: PasswordRestoreModel) {
        return this.http.post(URL + '/password/restore', data).pipe(catchError(handleError))
    }
    changePassword(data: PasswordChangeModel) {
        return this.http.post(URL + '/password/change', data).pipe(catchError(handleError))
    }
    IsLoggedIn() {
        return window.localStorage.getItem('refresh_token') != null
    }
}