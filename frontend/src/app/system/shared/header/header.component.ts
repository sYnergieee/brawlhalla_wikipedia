import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { LINKS } from 'src/app/shared/consts';
import { AuthService } from 'src/app/shared/services/auth.service';
import { FileService } from 'src/app/shared/services/file.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {
  constructor(private router: Router, private authService: AuthService, private userService: UserService, private fileService: FileService) { }
  user: any;
  isInitialized = false;
  ngOnInit() {
    this.userService.GetUserById(null).subscribe(
      (res: any) => {
        this.user = res
      },
      (err) => {
        if (err.error.detail == 'Token expired') {
          this.authService.refreshToken();
          this.ngOnInit();
        }
      }
    )
    this.isInitialized = true
  }
  getUserImage() {
    return this.fileService.GetUserImage(this.user.id)
  }
  usr: any
  img: any
  links = LINKS;
  goToProfile() {
    this.router.navigate(['/system/profile'], {
    });
  }
  logout() {
    this.authService.deleteTokens()
    this.router.navigate(['/auth/login'])
  }
  drawerColor(flag: boolean) {
    if (flag) {
      return { color: "#9400d3" };
    }
    return {};
  }
}
