export default class UserInfo {
  id: number;
  createTime: number;
  heartRateAlive: string;
  bloodPressure: string;
  sleepTime: string;
  heartRateMax: string;
  heartRateQuite: string;
  heartRateSour: string;

  constructor(id: number, createTime: number, hearRateAlive:string, bloodPressure: string, sleepTime: string,heartRateMax:string,
              heartRateQuite: string, heartRateSour:string) {
    this.id = id;
    this.createTime = createTime;
    this.heartRateAlive = hearRateAlive;
    this.bloodPressure = bloodPressure;
    this.sleepTime = sleepTime;
    this.heartRateMax = heartRateMax;
    this.heartRateQuite = heartRateQuite;
    this.heartRateSour = heartRateSour;
  }
}


