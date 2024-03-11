export class ChestSkinModel {
    constructor(public chest_id: any, public skin_id: any) { }
}
export class EventSkinModel {
    constructor(public event_id: any, public skin_id: any) { }
}
export class ChestPostModel {
    constructor(public name: any, public img: any, public cost: any) { }
}
export class EventPostModel {
    constructor(public name: any) { }
}
export class ChestSkinPostPutModel {
    constructor(public chest_id: any) { }
}
export class EventSkinPostPutModel {
    constructor(public event_id: any) { }
}