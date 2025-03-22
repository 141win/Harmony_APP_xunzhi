//调用登录请求的入参
export interface Account {
  userName:string
  password:string
}

// 登录成功后得到的数据
export interface UserDataType {
  userInfo:UserInfoType
  token:string
}

export interface UserInfoType{
  userName:string
  _id:string
  avatar:string
}