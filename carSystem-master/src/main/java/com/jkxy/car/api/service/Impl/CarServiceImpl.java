package com.jkxy.car.api.service.Impl;

import com.jkxy.car.api.dao.CarDao;
import com.jkxy.car.api.pojo.Car;
import com.jkxy.car.api.pojo.CarInventory;
import com.jkxy.car.api.service.CarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("carService")
public class CarServiceImpl implements CarService {
    @Autowired
    private CarDao carDao;

    @Override
    public List<Car> findAll() {
        return carDao.findAll();
    }

    @Override
    public Car findById(int id) {
        return carDao.findById(id);
    }

    @Override
    public List<Car> findByCarName(String carName) {
        return carDao.findByCarName(carName);
    }

    @Override
    public void deleteById(int id) {
        carDao.deleteById(id);
    }

    @Override
    public void updateById(Car car) {
        carDao.updateById(car);
    }

    @Override
    public void insertCar(Car car) {
        carDao.insertCar(car);
    }

    @Override
    @Transactional
    public String buyCar(int carId,int quantity) {
        String result=null;
            CarInventory carWithInventory=carDao.selectInventoryById(carId);
            if(carWithInventory!=null){
                if(quantity<=carWithInventory.getQuantity()){
                    carDao.updateInventoryById(carWithInventory.getId(),carWithInventory.getQuantity()-quantity);
                    result="购买成功:"+"成功购买"+carWithInventory.getCarName()+"-"+carWithInventory.getCarSeries()+"-"+carWithInventory.getCarType()+quantity+"辆!";
                }else{
                    result="购买失败:库存不足";
                }
            }else{
                result="无该车信息";
            }
            return result;
    }

    @Override
    public List<Car> selectByCarNameAndPage(String carName, int start, int end) {
        if (start <= end) {
            int size = end - start + 1;
            List<Car> carPage = carDao.selectByCarNameAndPage(carName, start - 1, size);
            return carPage;
        }
        return null;
    }
}
