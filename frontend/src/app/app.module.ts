import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { SharedModule } from 'src/app/shared/shared.module';
import { NotFoundPageComponent } from './not-found-page/not-found-page.component';
import { AuthModule } from './auth/auth.module';
import { DatePipe } from '@angular/common';
import { LegendService } from './shared/services/legend.service';
import { SkinService } from './shared/services/skin.service';
import { AuthService } from './shared/services/auth.service';
import { FileService } from './shared/services/file.service';
import { UserService } from './shared/services/user.service';
import { NgxPhotoEditorModule } from 'ngx-photo-editor';

@NgModule({
  declarations: [
    AppComponent,
    NotFoundPageComponent,
  ],
  imports: [
    BrowserModule,
    AuthModule,
    AppRoutingModule,
    SharedModule,
    NgxPhotoEditorModule,
    BrowserAnimationsModule
  ],
  providers: [DatePipe, LegendService, SkinService, AuthService, FileService, UserService],
  bootstrap: [AppComponent]
})
export class AppModule { }
