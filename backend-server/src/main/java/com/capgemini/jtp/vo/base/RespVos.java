package com.capgemini.jtp.vo.base;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;


/**
 * create by: MmmLll_Shen
 * description:
 * create time: 10:58 2019/9/25
 */
@Data
@ApiModel(description = "返回数据")
public class RespVos<T> {

    @ApiModelProperty(value = "数据总长度")
    private Integer size;

    @ApiModelProperty(value = "返回数据数组")
    private List<T> vos;
}
