import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Router } from '@angular/router';
import { map, startWith } from 'rxjs';
import { SelectInput } from 'src/app/shared/models/input.model';
import { FileService } from 'src/app/shared/services/file.service';
import { UserService } from 'src/app/shared/services/user.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss']
})
export class UsersComponent implements OnInit {
  constructor(private userService: UserService, private fileService: FileService, private router: Router) { }
  users: any
  roles: any
  offset: number = 1
  LIMIT: number = 10
  isInitialized = false;
  ngOnInit(): void {
    this.userService.GetUsersAll(this.LIMIT, null, null, null).subscribe(
      (res: any) => {
        this.users = res.items
      }
    )
    this.userService.GetRolesAll().subscribe(
      (res: any) => {
        this.roles = res
        this.roleInput.icon = 'keyboard_arrow_down';
        this.roleInput.values = this.compile_values('role_id', this.roles)
      }
    )
    this.isInitialized = true
  }
  form = new FormGroup({
    substr: new FormControl(null),
    role_id: new FormControl(null),
  });
  roleInput: SelectInput = {
    field: 'role_id',
    type: 'text',
    label: 'Loading roles...',
    formControl: this.form.get('role_id')
  }
  private _filterValues(value: any, items: any[]) {
    return items.filter((item) =>
      item.name.toLowerCase().includes(value.toLowerCase())
    );
  }

  compile_values(name: string, arr: any[]) {
    return this.form.get(name)?.valueChanges.pipe(
      startWith(''),
      map((value) => (value ? this._filterValues(value, arr) : arr.slice()))
    );
  }
  forwardOffset() {
    this.offset += 1
    const { substr, role_id } = this.form.value
    let rol = null
    if (role_id != null) {
      rol = this.roles.find((i: any) => i.name == role_id)
      if (rol) {
        rol = rol.id
      }
    }
    this.userService.GetUsersAll(this.LIMIT, this.offset - 1, substr, rol).subscribe(
      (res: any) => {
        this.users = res.items
      }
    )
  }
  backOffset() {
    this.offset -= 1
    const { substr, role_id } = this.form.value
    let rol = null
    if (role_id != null) {
      rol = this.roles.find((i: any) => i.name == role_id)
      if (rol) {
        rol = rol.id
      }
    }
    this.userService.GetUsersAll(this.LIMIT, this.offset - 1, substr, rol).subscribe(
      (res: any) => {
        this.users = res.items
      }
    )
  }
  getUserImage(id: number) {
    return this.fileService.GetUserImage(id)
  }
  applyFilter() {
    const { substr, role_id } = this.form.value
    let rol = null
    if (role_id != null) {
      rol = this.roles.find((i: any) => i.name == role_id)
      if (rol) {
        rol = rol.id
      }
    }
    this.offset = 1
    this.userService.GetUsersAll(this.LIMIT, null, substr, rol).subscribe(
      (res: any) => {
        this.users = res.items
      }
    )
  }
  goToProfile(id: number) {
    this.router.navigate(['/system/profile'], {
      queryParams: {
        id: id
      },
    });
  }
}
