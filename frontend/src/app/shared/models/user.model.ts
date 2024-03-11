export class SignInModel {
    constructor(public username: any, public password: any) { }
}

export class SignUpModel {
    constructor(public email: any, public password: any, public nickname: any) { }
}

export class UserPutModel {
    constructor(public id: any, public nickname: any, public email: any, public password: any, public firstname: any, public lastname: any, public telegram: any, public discord: any, public role_id: any) { }
}

export class PasswordRestoreModel {
    constructor(public email: any) { }
}

export class PasswordChangeModel {
    constructor(public code: any, public password: any) { }
}