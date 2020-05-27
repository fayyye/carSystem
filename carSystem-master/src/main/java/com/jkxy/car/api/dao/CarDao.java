package com.jkxy.car.api.dao;

import com.jkxy.car.api.pojo.Car;
import com.jkxy.car.api.pojo.CarInventory;
import org.apache.ibatis.annotations.*;

import java.util.List;


@Mapper
public interface CarDao {
    @Select("select * from carMessage")
    List<Car> findAll();

    @Select("select * from carMessage where id = #{id}")
    Car findById(int id);

    @Select("select * from carMessage where carName = #{carName}")
    List<Car> findByCarName(String carName);

    @Delete("delete from carMessage where id = #{id}")
    void deleteById(int id);

    @Update("update carMessage set carName=#{carName},carType=#{carType},price=#{price},carSeries=#{carSeries} where id = #{id}")
    void updateById(Car car);

    @Insert("insert into carMessage(carName,carType,price,carSeries) values(#{carName},#{carType},#{price},#{carSeries})")
    void insertCar(Car car);

    @Select("select * from carMessage where carName like concat('%',#{carName},'%') limit #{start}, #{size}")
    List<Car> selectByCarNameAndPage(String carName, int start, int size);

    @Select("select a.id,a.carName,a.carSeries,a.carType,a.price,b.quantity from carMessage a,inventory b where a.id=b.car_message_id and a.id=#{id}")
    CarInventory selectInventoryById(int id);

    @Update("update inventory set quantity=#{quantity} where car_message_id = #{id}")
    void updateInventoryById(int id,int quantity);
}
