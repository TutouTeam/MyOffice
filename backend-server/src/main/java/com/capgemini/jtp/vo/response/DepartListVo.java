package com.capgemini.jtp.vo.response;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DepartListVo {
    private String departName;
    private String principalUser;
    private int connectTelNo;
    private int connectMobileTelNo;
    private int faxes;
    private int branchId;
    private String branchName;

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName;
    }

    public String getDepartName() {
        return departName;
    }

    public void setDepartName(String departName) {
        this.departName = departName;
    }

    public String getPrincipalUser() {
        return principalUser;
    }

    public void setPrincipalUser(String principalUser) {
        this.principalUser = principalUser;
    }

    public int getConnectTelNo() {
        return connectTelNo;
    }

    public void setConnectTelNo(int connectTelNo) {
        this.connectTelNo = connectTelNo;
    }

    public int getConnectMobileTelNo() {
        return connectMobileTelNo;
    }

    public void setConnectMobileTelNo(int connectMobileTelNo) {
        this.connectMobileTelNo = connectMobileTelNo;
    }

    public int getFaxes() {
        return faxes;
    }

    public void setFaxes(int faxes) {
        this.faxes = faxes;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }
}
