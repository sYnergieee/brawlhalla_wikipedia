export class ReviewPutModel {
    constructor(public text: any, public mark: any, public id: any) { }
}
export class ReviewPostModel {
    constructor(public text: any, public mark: any, public legend_id: any, public type_id: any) { }
}
export class LikeModel {
    constructor(public review_id: any) { }
}