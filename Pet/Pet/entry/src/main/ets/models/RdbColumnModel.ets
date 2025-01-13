
import ColumnInfo from '../viewmodel/ColumnInfo';

//用户数据库字段
export const columnUserInfoInfoList: Array<ColumnInfo> = [
  new ColumnInfo('id', 'integer', -1, false, true, true),
  new ColumnInfo('createTime', 'long', -1, false, false, false),
  new ColumnInfo('username', 'text', -1, false, false, false),
  new ColumnInfo('password', 'text', -1, false, false, false),
];

export const columnHealthInfoInfoList: Array<ColumnInfo> = [
  new ColumnInfo('id', 'integer', -1, false, true, true),
  new ColumnInfo('createTime', 'long', -1, false, false, false),
  new ColumnInfo('heartRateAlive', 'text', -1, false, false, false),
  new ColumnInfo('bloodPressure', 'text', -1, false, false, false),
  new ColumnInfo('sleepTime', 'text', -1, false, false, false),
  new ColumnInfo('heartRateMax', 'text', -1, false, false, false),
  new ColumnInfo('heartRateQuite', 'text', -1, false, false, false),
  new ColumnInfo('heartRateSour', 'text', -1, false, false, false),
];



