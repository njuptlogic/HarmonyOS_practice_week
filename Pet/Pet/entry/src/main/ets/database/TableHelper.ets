
import { Logger } from '../utils/Logger';
import ColumnInfo from '../viewmodel/ColumnInfo';



//数据库表的帮助类
class TableHelper {
  createTableSql(tableName: string, columns: Array<ColumnInfo>): string {
    let sql = `create table if not exists ${tableName}(`;
    for (let column of columns) {
      sql = sql.concat(`${column.name} ${column.type}`);
      sql = sql.concat(`${column.length && column.length > 0 ? `(${column.length})` : ''}`);
      sql = sql.concat(`${column.primary ? ' primary key' : ''}`);
      sql = sql.concat(`${column.autoincrement ? ' autoincrement' : ''}`);
      sql = sql.concat(`${column.nullable ? '' : ' not null'}`);
      sql = sql.concat(', ');
    }
    sql = `${sql.substring(0, sql.length - 2)})`;
    return sql;
  }

  addTableColumnSql(tableName: string, column: ColumnInfo): string {
    Logger.info(`TableHelper updateTableSql : ${JSON.stringify(column)}`);
    let sql = `alter table ${tableName} add `;
    sql = sql.concat(`${column.name} ${column.type}`);
    sql = sql.concat(`${column.length && column.length > 0 ? `(${column.length})` : ''}`);
    Logger.info(`TableHelper updateTableSql : ` + sql);
    return sql;
  }

  deleteTableSql(tableName: string): string {
    Logger.info(`TableHelper deleteTableSql : ${JSON.stringify(tableName)}`);
    return `drop table if exists ${tableName}`;
  }
}

const tableHelper = new TableHelper();

export default tableHelper;