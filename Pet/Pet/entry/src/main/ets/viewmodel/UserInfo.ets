export default class UserInfo {
  id: number;
  createTime: number;
  username: string;
  password: string;

  constructor(id: number, createTime: number, username: string, password: string) {
    this.id = id;
    this.createTime = createTime;
    this.username = username;
    this.password = password;
  }
}


