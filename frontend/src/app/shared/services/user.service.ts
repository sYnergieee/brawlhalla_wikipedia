import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, of } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { handleError } from '../handle_error';
import { ApplicationPostModel } from '../models/application.model';
import { LikeModel, ReviewPostModel, ReviewPutModel } from '../models/review.model';
import { UserPutModel } from '../models/user.model';

const URL = `${environment.BACKEND_URL}/users`;


@Injectable({
    providedIn: 'root',
})
export class UserService {
    constructor(private http: HttpClient, private authService: AuthService) { }
    GetUsersAll(limit: number | null, offset: number | null, substr: any, role_id: number | null) {
        let f = false
        let url = `${URL}/all`
        if (limit != null) {
            f = true
            url += `?limit=${limit}`
        }
        if (offset != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `offset=${offset}`
        }
        if (substr != null && substr.length > 0) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `substr=${substr}`
        }
        if (role_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `role_id=${role_id}`
        }
        return this.http.get(url)
    }
    GetRolesAll(): Observable<any> {
        return of([
            { id: 1, name: 'User' },
            { id: 2, name: 'Admin' },
        ]);
    }
    GetUserById(id: number | null) {
        let token = this.authService.getAccessToken()
        let url = `${URL}/by_id`
        if (id != null) {
            url += `?user_id=${id}`
        }
        return this.http.get(url, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    GetApplicationsAll(limit: number | null, offset: number | null) {
        let token = this.authService.getAccessToken()
        let f = false
        let url = `${URL}/application`
        if (limit != null) {
            f = true
            url += `?limit=${limit}`
        }
        if (offset != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `offset=${offset}`
        }
        return this.http.get(url, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PostApplication(appl: ApplicationPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/application`, appl, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    DeleteApplication(appl_id: number) {
        let token = this.authService.getAccessToken()
        return this.http.delete(`${URL}/application?appl_id=${appl_id}`, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PostFavourite(legend_ids: any[]) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/favourite`, legend_ids, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    GetReviews(limit: number | null, offset: number | null, legend_id: number | null, user_id: number | null, type_id: number | null) {
        let token = this.authService.getAccessToken()
        let f = false
        let url = `${URL}/reviews`
        if (limit != null) {
            f = true
            url += `?limit=${limit}`
        }
        if (offset != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `offset=${offset}`
        }
        if (legend_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `legend_id=${legend_id}`
        }
        if (user_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `user_id=${user_id}`
        }
        if (type_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `type_id=${type_id}`
        }
        return this.http.get(url, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PutReview(review: ReviewPutModel) {
        let token = this.authService.getAccessToken()
        return this.http.put(`${URL}/review`, review, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PostReview(review: ReviewPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/review`, review, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    DeleteReview(id: number) {
        let token = this.authService.getAccessToken()
        return this.http.delete(`${URL}/review/${id}`, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PutUser(user: UserPutModel) {
        let token = this.authService.getAccessToken()
        return this.http.put(`${URL}`, user, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    DeleteUser() {
        let token = this.authService.getAccessToken()
        return this.http.delete(`${URL}`, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PostLike(like: LikeModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/like`, like, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
}