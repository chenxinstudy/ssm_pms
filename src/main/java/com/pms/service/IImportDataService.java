package com.pms.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * @author 酷酷的鑫
 */
public interface IImportDataService {

    String insertMATable(MultipartFile excel) throws Exception;

    String insertReissueTable(MultipartFile excel) throws Exception;
}
