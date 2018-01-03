package ${groupId}.${artifactId}.provider.persistence.typehandler;

import ${groupId}.${artifactId}.domain.enums.DelFlag;
import org.apache.ibatis.type.BaseTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedTypes;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

<#include "/basic/author.include"/>
@MappedTypes(DelFlag.class)
public class DelFlagTypeHandler extends BaseTypeHandler<DelFlag> {

    @Override
    public void setNonNullParameter(PreparedStatement preparedStatement, int i, DelFlag item, JdbcType jdbcType) throws SQLException {
        preparedStatement.setObject(i, item.getIndex());
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