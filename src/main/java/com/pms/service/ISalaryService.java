package com.pms.service;

import com.pms.exception.CustomException;
import com.pms.vo.SalaryPages;

/**
 * @program: ssm
 * @Author：admin
 * @Description：
 * @Date：23:23 2022/3/9
 * @Version: 1.0
 */
public interface ISalaryService {
    public void insertSalaryByAcountAndDate(String eAccount, String date) throws CustomException;
    public void insertSalaryAllByDate(String date) throws CustomException;
    public SalaryPages selectSalaryByEaccountDIdDate(Integer pageNum,Integer limit,String eAccount,Integer dId,String sTime);
    public void deleteSalaryByEid(int[] ids);
    public void updateSalaryBySid(int[] ids);

    public  SalaryPages selectSalaryByEaccountDIdDateState(int pageNum, int limit, String eAccount, Integer dId, String sTime);

    void updateSalaryByEidAndRissuePay(int sId, double rissuePay);
}
