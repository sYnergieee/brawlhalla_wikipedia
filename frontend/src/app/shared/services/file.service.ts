import { HttpClient } from '@angular/common/http';
import { EventEmitter, Injectable, Output } from '@angular/core';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { catchError } from 'rxjs';
import { handleError } from '../handle_error';

const URL = `${environment.BACKEND_URL}/files`;


@Injectable({
    providedIn: 'root',
})
export class FileService {
    constructor(private http: HttpClient, private authService: AuthService) { }
    @Output() FileUnloaded = new EventEmitter();
    GetUserImage(user_id: number) {
        // let r_s = this.makeString()
        return `${URL}/abcde/${user_id}`
    }
    makeString(): string {
        let outString: string = '';
        let inOptions: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
        for (let i = 0; i < 32; i++) {
            outString += inOptions.charAt(Math.floor(Math.random() * inOptions.length));
        }
        return outString;
    }
    upoadImgUser(formData: any){
        let token = this.authService.getAccessToken()
        return this.http.post(`${URL}/`, formData, {
          headers: { Authorization: `Bearer ${token}` },
        }).pipe(catchError(handleError));
      }
    UploadImageUser(fileImg: any){
        let formData = new FormData();
        formData.append('file', fileImg);
        console.log(formData);
        let s = this.upoadImgUser(formData).subscribe(
          (data) => {
            s.unsubscribe();
            this.FileUnloaded.emit(data);
          }
        )
      }
}