import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { LegendPostModel, LegendPutModel, WeaponPostModel } from '../models/legend.model';
import { AuthService } from './auth.service';
import { catchError } from 'rxjs';
import { handleError } from '../handle_error';

const URL = `${environment.BACKEND_URL}/legends`;


@Injectable({
    providedIn: 'root',
})
export class LegendService {
    constructor(private http: HttpClient, private authService: AuthService) { }
    GetLegendsAll() {
        return this.http.get(`${URL}/all`)
    }
    GetWeaponsAll() {
        return this.http.get(`${URL}/weapons/all`)
    }
    GetLegendsAllFull(
        substr: any,
        weapon_ids: number[] | null,
        cost: any,
        strength: any,
        dexterity: any,
        defense: any,
        speed: any) {
        let f = false
        let url = `${URL}/all_full`
        if (substr != null && substr.length > 0) {
            f = true
            url += `?substr=${substr}`
        }
        if (weapon_ids != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            weapon_ids.forEach((i) => {
                url += `weapon_ids=${i}&`
            })
        }
        if (cost != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `cost=${cost}`
        }
        if (strength != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `strength=${strength}`
        }
        if (dexterity != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `dexterity=${dexterity}`
        }
        if (defense != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `defense=${defense}`
        }
        if (speed != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `speed=${speed}`
        }
        return this.http.get(url)
    }
    GetWeaponSkinsAll(limit: number | null, offset: number | null, substr: any, weapon_type_ids: number[] | null, legend_id: number | null, event_ids: number[] | null, chest_ids: number[] | null) {
        let f = false
        let url = `${URL}/weapon_skins/all`
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
        if (weapon_type_ids != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            weapon_type_ids.forEach((i) => {
                url += `weapon_type_ids=${i}&`
            })
        }
        if (legend_id != null) {
            if (!f) {
                url += '?'
                f = true
            }
            else url += '&'
            url += `legend_id=${legend_id}`
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
    AddWeapon(weapon: WeaponPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/weapon`, weapon, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    AddLegend(legend: LegendPostModel) {
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/`, legend, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    PutLegend(legend: LegendPutModel) {
        let token = this.authService.getAccessToken()
        return this.http.put(`${URL}/`, legend, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    DeleteLegend(id: number) {
        let token = this.authService.getAccessToken()
        return this.http.delete(`${URL}/${id}`, {
            headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError))
    }
    GetLegendById(id: number) {
        return this.http.get(`${URL}/${id}`)
    }
}