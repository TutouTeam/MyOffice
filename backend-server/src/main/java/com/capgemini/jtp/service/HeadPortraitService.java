package com.capgemini.jtp.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface HeadPortraitService {
    int headUpload(MultipartFile file, HttpServletRequest request) throws IOException;
    int headDownload(HttpServletRequest request, HttpServletResponse response);
}
