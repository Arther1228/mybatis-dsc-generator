/**
 * @filename:${entityName} ${createTime}
 * @project ${project}  ${version}
 * Copyright(c) 2020 ${author} Co. Ltd. 
 * All right reserved. 
 */
package ${entityUrl};
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.FieldFill;
<#if isSwagger=="true" >
import io.swagger.annotations.ApiModelProperty;
</#if>
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.io.Serializable;
<#list pkgs as ps>
	<#if ps??>
import ${ps};
	</#if>
</#list>

/**   
 * <p>自动生成工具：mybatis-dsc-generator</p>
 * 
 * <p>说明： ${entityComment}实体类</P>
 * @version: ${version}
 * @author: ${author}
 * 
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@ApiModel(value = "${entityComment}", description = "${entityComment}")
public class ${entityName} extends Model<${entityName}> {

	private static final long serialVersionUID = ${agile}L;
	
<#list cis as ci>
 <#if ci.javaType=="Date">
  <#if ci.jdbcType=="date">
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern="yyyy-MM-dd",timezone = "GMT+8")
  <#elseif ci.jdbcType=="time">
    @DateTimeFormat(pattern = "HH:mm:ss")
	@JsonFormat(pattern="HH:mm:ss",timezone = "GMT+8")
  <#else>
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
  </#if>
 </#if>
 <#if ci.property=="id">
	@TableId(value = "id", type = IdType.INPUT)
    @TableField(fill = FieldFill.INSERT)
 </#if>
<#if ci.property=="addTime">
    @TableField(fill = FieldFill.INSERT)
</#if>

 <#if isSwagger=="true" >
     <#if ci.property=="id" || ci.property=="addTime">
         @ApiModelProperty(name = "${ci.property}", value = "${ci.comment}", hidden = true)
    <#else>
        @ApiModelProperty(name = "${ci.property}", value = "${ci.comment}")
     </#if>
 </#if>
	private ${ci.javaType} ${ci.property};
    
</#list>

	@Override
    protected Serializable pkVal() {
        return this.id;
    }
}
	