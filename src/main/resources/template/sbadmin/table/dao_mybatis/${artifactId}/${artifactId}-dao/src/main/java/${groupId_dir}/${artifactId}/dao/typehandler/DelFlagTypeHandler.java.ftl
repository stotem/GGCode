package ${groupId}.${artifactId}.dao.typehandler;

import ${groupId}.${artifactId}.domain.enums.DelFlag;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

<#include "/basic/author.include"/>
public class DelFlagTypeHandler extends BaseTypeHandler<DelFlag> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, DelFlag delFlag, JdbcType jdbcType) throws SQLException {
        preparedStatement.setObject(i, delFlag.getIndex());
    }

    @Override
    public DelFlag getNullableResult(ResultSet resultSet, String s) throws SQLException {
        final short anShort = resultSet.getShort(s);
        if (resultSet.wasNull()) {
            return null;
        }
        return DelFlag.getByIndex(Short.valueOf(anShort));
    }

    @Override
    public DelFlag getNullableResult(ResultSet resultSet, int i) throws SQLException {
        final short anShort = resultSet.getShort(i);
        if (resultSet.wasNull()) {
            return null;
        }
        return DelFlag.getByIndex(Short.valueOf(anShort));
    }

    @Override
    public DelFlag getNullableResult(CallableStatement callableStatement, int i) throws SQLException {
        final short anShort = callableStatement.getShort(i);
        if (callableStatement.wasNull()) {
            return null;
        }
        return DelFlag.getByIndex(Short.valueOf(anShort));
    }
}