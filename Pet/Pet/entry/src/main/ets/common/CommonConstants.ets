
import relationalStore from '@ohos.data.relationalStore';
import CommonConstantsInfo from '../viewmodel/CommonConstantsInfo';


export default class CommonConstants {

  /**
   * Small font size.
   */
  static readonly SET_SIZE_SMALL: number = 0.8;

  /**
   * Normal font size.
   */
  static readonly SET_SIZE_NORMAL: number = 1;

  /**
   * Large font size.
   */
  static readonly SET_SIZE_LARGE: number = 1.2;

  /**
   * Extra large font size.
   */
  static readonly SET_SIZE_EXTRA_LARGE: number = 1.4;

  /**
   * Huge font size.
   */
  static readonly SET_SIZE_HUGE: number = 1.6;

  /**
   * Slider min value.
   */
  static readonly SET_SLIDER_MIN: number = 0.8;

  /**
   * Slider max value.
   */
  static readonly SET_SLIDER_MAX: number = 1.6;

  /**
   * Slider step length.
   */
  static readonly SET_SLIDER_STEP: number = 0.2;



  static readonly STORE_CONFIG: relationalStore.StoreConfig = {
    name: 'database.db',
    securityLevel: relationalStore.SecurityLevel.S1
  };

  static readonly RDB_NAME = { dbName: 'health.db' } as CommonConstantsInfo; // db name

  // radius
  static readonly BORDER_RADIUS_PERCENT_50: string = '50%';

  static readonly HOME_BTN_Z = 2;



  static readonly BORDER_RADIUS: number = 24

  static readonly BORDER_RADIUS_DELETE: number = 12

  static readonly TASK_WIDTH: string = '93.3%'

  static readonly COLUMN_SPACE: number = 16


  /**
   * Log tag.
   */
  static readonly RDB_TAG = '[Debug.Rdb]';
  static readonly TABLE_TAG = '[Debug.TaskTable]';
  static readonly INDEX_TAG = '[Debug.Index]';


  /** task info table */
  static readonly USER_INFO = {
    tableName: 'userInfo',
    columns: [
      'id',
      'createTime',
      'username',
      'password',
    ]
  } as CommonConstantsInfo

  static readonly HEALTH_INFO = {
    tableName: 'healthInfo',
    columns: [
      'id',
      'createTime',
      'heartRateAlive',
      'bloodPressure',
      'sleepTime',
      'heartRateMax',
      'heartRateQuite',
      'heartRateSour'
    ]
  } as CommonConstantsInfo


  // THOUSANDTH
  static readonly THOUSANDTH_15: string = '1.5%'; // ‘1.5%’
  static readonly THOUSANDTH_12: string = '2.2%'; // ‘2.2%’
  static readonly THOUSANDTH_33: string = '3.3%'; // ‘3.3%’
  static readonly THOUSANDTH_50: string = '5%'; // ‘5%’
  static readonly THOUSANDTH_66: string = '6.6%'; // ‘6.6%’
  static readonly THOUSANDTH_80: string = '8%'; // ‘8%’
  static readonly THOUSANDTH_100: string = '10%'; // ‘10%’
  static readonly THOUSANDTH_120: string = '12%'; // ‘12%’
  static readonly THOUSANDTH_160: string = '16%'; // ‘16%’
  static readonly THOUSANDTH_400: string = '40%'; // ‘40%’
  static readonly THOUSANDTH_420: string = '42%'; // ‘42%’
  static readonly THOUSANDTH_500: string = '50%'; // ‘50%’
  static readonly THOUSANDTH_560: string = '56%'; // ‘56%’
  static readonly THOUSANDTH_750: string = '75%'; // ‘75%’
  static readonly THOUSANDTH_800: string = '80%'; // ‘80%’
  static readonly THOUSANDTH_830: string = '83%'; // ‘83%’
  static readonly THOUSANDTH_880: string = '88%'; // ‘88%’
  static readonly THOUSANDTH_900: string = '90%'; // ‘90%’
  static readonly THOUSANDTH_940: string = '94%'; // ‘90%’
  static readonly THOUSANDTH_1000: string = '100%'; // ‘100%’
}