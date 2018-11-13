<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
  
  <!-- Trigger the modal with a button -->
  <!-- Modal -->
  <div class="modal fade" id="order-detail-modal" role="dialog">
    <div class="detail-modal-dialog modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="detail-modal-body">
          <div class="row">
            <div class="container">
              <div id="in-detail-header">
              </div>
               <table class="table table-hover order-detail-table">
                <tbody>
                  <tr class="order-list-row">
                    <td colspan="5" class="order-inform text-left" id="in-detail-body">
                    
                    </td>
                    <td id="in-detail-side">
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div>
          <table class="detail-inform-table text-center">
            <tbody id="in-detail-inform">
              
            </tbody>
          </table>
          </div>
        </div>
      </div>
    </div>
  </div> 
 </div>
