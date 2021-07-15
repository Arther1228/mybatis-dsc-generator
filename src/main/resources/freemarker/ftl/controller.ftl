/**
 * @filename:${entityName}Controller ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2020 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${controllerUrl};

import ${entityUrl}.${entityName};
import ${serviceUrl}.${entityName}Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import com.suncreate.bigdata.util.JsonResult;
import io.swagger.annotations.ApiParam;
<#if isSwagger=="true" >
import io.swagger.annotations.Api;
</#if>

/**   
 * <p>自动生成工具：mybatis-dsc-generator</p>
 * 
 * <p>说明：${entityComment}API接口层</P>
 * @version: ${version}
 * @author: ${author}
 * @time    ${createTime}
 *
 */
 <#if isSwagger=="true" >
@Api(description = "${entityComment}", value="${entityComment}" )
</#if>
@RestController
@RequestMapping("/api/v1")
public class ${entityName}Controller extends AbstractController<${entityName}Service,${entityName}>{

@PostMapping("/crk")
@ApiOperation(value = "添加", notes = "作者：suncreate")
public JsonResult<${entityName}> insert(@RequestBody @ApiParam(name = "${entityComment}", value = "传入json格式", required = true) ${entityName} entity) {
 JsonResult<${entityName}> result = new JsonResult<${entityName}>();
   if (null != entity) {
   boolean rsg = baseService.save(entity);
   if (rsg) {
   result.success("");
   } else {
   result.error("添加失败！");
   }
   } else {
   result.error("请传入正确参数！");
   }
   return result;
   }
	
}