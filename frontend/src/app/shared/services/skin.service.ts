import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { ChestPostModel, ChestSkinModel, EventPostModel, EventSkinModel } from '../models/event.model';
import { AuthService } from './auth.service';
import { catchError } from 'rxjs';
import { handleError } from '../handle_error';
import { SkinPostModel, SkinPutModel } from '../models/skin.model';

const URL = `${environment.BACKEND_URL}/skins`;


@Injectable({
    providedIn: 'root',
})
export class SkinService {
    constructor(private http: HttpClient, private authService: AuthService) { }
    GetEventsAll() {
        return this.http.get(`${URL}/events/all`)
    }
    GetChestsAll() {
        return this.http.get(`${URL}/chests/all`)
    }
    GetSkinsAll(limit: number | null, offset: number | null, substr: any, legend_id: number | null, is_exclusive: boolean | null, is_crossover: boolean | null, event_ids: number[] | null, chest_ids: number[] | null) {
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
        if (legend_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `legend_id=${legend_id}`
        }
        if (is_exclusive != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `is_exclusive=${is_exclusive}`
        }
        if (is_crossover != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `is_crossover=${is_crossover}`
        }
        if (event_ids != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            event_ids.forEach((i) => {
                url += `event_ids=${i}&`
            })
        }
        if (chest_ids != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            chest_ids.forEach((i) => {
                url += `chest_ids=${i}&`
            })
        }
        return this.http.get(url)
    }
    GetChestById(id: number) {
        return this.http.get(`${URL}/chest/${id}`)
    }
    GetEventById(id: number) {
        return this.http.get(`${URL}/event/${id}`)
    }
    DeleteEventSkin(event_skin: EventSkinModel) {
        let token = this.authService.getAccessToken()
        const httpOptions = {
            headers: new HttpHeaders({
                'Content-Type': 'application/json',
                Authorization: `Bearer ${token}`
            }),
            body: event_skin
        };
        return this.http.delete(`${URL}/event_skin/`, httpOptions)
    }
    DeleteChestSkin(chest_skin: ChestSkinModel) {
        let token = this.authService.getAccessToken()
        const httpOptions = {
            headers: new HttpHeaders({
                'Content-Type': 'application/json',
                Authorization: `Bearer ${token}`
            }),
            body: chest_skin
        };
        return this.http.delete(`${URL}/chest_skin/`, httpOptions)
    }
    AddChest(chest: ChestPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/chest`, chest, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    AddEvent(event: EventPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/event`, event, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    GetSkinById(id: number) {
        return this.http.get(`${URL}/${id}`)
    }
    DeleteSkinById(id: number) {
        let token = this.authService.getAccessToken()
        return this.http.delete(`${URL}/${id}`, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PutSkin(skin: SkinPutModel) {
        let token = this.authService.getAccessToken()
        return this.http.put(`${URL}`, skin, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PostSkin(skin: SkinPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}`, skin, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
}