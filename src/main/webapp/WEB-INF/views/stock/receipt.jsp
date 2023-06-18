<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<span style="font-family: &quot;맑은 고딕&quot;; font-size: 10pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <style>
#approvalTable input {
    text-align: center
}

.custom-td-style {
    background: rgb(255, 255, 255);
    padding: 5px;
    border: 1px solid #e5e5e5;
    border-image: none;
    height: 25px;
    text-align: center;
    color: rgb(81, 81, 81);
    font-size: 14px;
    font-weight: bold;
    vertical-align: middle;
}

.custom2-td-style {
    background: rgb(255, 255, 255);
    padding: 5px;
    border: 1px solid #e5e5e5;
    border-image: none;
    height: 25px;
    text-align: center;
    color: rgb(81, 81, 81);
    font-size: 14px;
    vertical-align: middle;
}
</style>

<table style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 1px; border-collapse: collapse;"><!-- Header -->
  <colgroup>
   <col width="310">
   <col width="490">
  </colgroup>

	<tbody>
		<tr>
			<td style="background: white; padding: 0px !important; border: 0px currentColor; border-image: none; height: 65px; ttext-align: center; color: black; font-size: 28px; font-weight: bold; vertical-align: middle;"
                class="dext_table_border_t dext_table_border_r dext_table_border_b dext_table_border_l">
                8월 정산내역서
			</td>

		</tr>
	</tbody>
</table>

<table style="border: 0px solid rgb(0, 0, 0); border-image: none; width: 800px; font-family: malgun gothic, dotum, arial, tahoma; margin-top: 10px; border-collapse: collapse;"><colgroup>

  </colgroup>

	<tbody>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">제목</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; text-align: left; color: rgb(0, 0, 0); font-size: 14px; vertical-align: middle;"
                colspan="5">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="6"
                      data-dsl="{{text:subject}}" data-wrapper=""
                      style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor" type="text"><span contenteditable="false"
                                                                                class="comp_active"
                                                                                style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px; display: none;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="6"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"
                rowspan="2">품명</td>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"
                rowspan="2">규격</td>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"
                rowspan="2">수량</td>
			<td style="background: rgb(221, 221, 221); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"
                colspan="2" class="dext_table_border_t">구매예정가격</td>
		</tr>
		<tr>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">단가</td>
			<td style="background: rgb(221, 221, 221); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;">금액</td>
		</tr>
		<tr>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="23" data-dsl="{{text}}"
                      data-wrapper=""
                      style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor" type="text"><span contenteditable="false"
                                                                                class="comp_active"
                                                                                style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="23"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
			<td style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: left; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="22" data-dsl="{{text}}"
                      data-wrapper=""
                      style="width: 100%; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor" type="text"><span contenteditable="false"
                                                                                class="comp_active"
                                                                                style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="22"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
			<td class="productCnt"
                style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: right; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="17" data-dsl="{{number}}"
                      data-wrapper=""
                      style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor ipt_editor_num" type="text"><span contenteditable="false"
                                                                                               class="comp_active"
                                                                                               style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="17"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
			<td class="unitPrice"
                style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: right; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="7" data-dsl="{{currency_0}}"
                      data-wrapper=""
                      style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span
                        contenteditable="false" class="comp_active"
                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="7"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>
			<td class="price"
                style="background: rgb(255, 255, 255); padding: 5px; border: 1px solid black; border-image: none; height: 25px; text-align: right; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="8" data-dsl="{{currency_0}}"
                      data-wrapper=""
                      style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span
                        contenteditable="false" class="comp_active"
                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="8"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span><br>
			</td>

		</tr>

		<tr>
			<td style="background: rgb(221, 221, 221); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; border-image: none; height: 25px; text-align: center; color: rgb(0, 0, 0); font-size: 14px; font-weight: bold; vertical-align: middle;"
                colspan="3" class="dext_table_border_t">합계</td>
			<td class="totalPrice dext_table_border_t"
                style="background: rgb(255, 255, 255); border-width: medium 1px 1px; border-style: none solid solid; border-color: currentColor black black; padding: 5px; border-image: none; height: 25px; text-align: right; color: rgb(0, 0, 0); font-size: 14px; font-weight: normal; vertical-align: middle;"
                colspan="3">
				<span unselectable="on" contenteditable="false" class="comp_wrap" data-cid="37"
                      data-dsl="{{currency_0}}" data-wrapper=""
                      style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"
                      data-value=""><input class="ipt_editor ipt_editor_currency" type="text"><span
                        contenteditable="false" class="comp_active"
                        style="display: none; font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <span
                        class="Active_dot1"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot2"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> <span
                        class="Active_dot3"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span><span
                        class="Active_dot4"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"></span> </span> <span
                        contenteditable="false" class="comp_hover" data-content-protect-cover="true" data-origin="37"
                        style="font-family: &quot;malgun gothic&quot;, dotum, arial, tahoma; font-size: 11pt; line-height: normal; margin-top: 0px; margin-bottom: 0px;"> <a
                        contenteditable="false" class="ic_prototype ic_prototype_trash"
                        data-content-protect-cover="true" data-component-delete-button="true"></a> </span> </span>&nbsp;VAT(별도)
			</td>

</tr>
</tbody>
</table>
    <table>
  <colgroup>

  </colgroup>
  <tbody>
    <tr>
      <td>제목</td>
      <td colspan="5">
        <input type="text">
      </td>
    </tr>
    <tr>
      <td rowspan="2">품명</td>
      <td rowspan="2">규격</td>
      <td rowspan="2">수량</td>
      <td colspan="2">구매예정가격</td>
    </tr>
    <tr>
      <td>단가</td>
      <td>금액</td>
    </tr>
    <tr>
      <td>
        <input type="text">
      </td>
      <td>
        <input type="text">
      </td>
      <td class="productCnt">
        <input type="text">
      </td>
      <td class="unitPrice">
        <input type="text">
      </td>
      <td class="totalPrice">
        <input type="text">
      </td>
    </tr>
  </tbody>
</table>

</span>

</html>



