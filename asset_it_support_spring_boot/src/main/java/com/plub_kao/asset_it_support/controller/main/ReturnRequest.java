package com.plub_kao.asset_it_support.controller.main;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class ReturnRequest {
    private Integer borrowerEquipmentId;
    private Integer statusId;
    private LocalDate returnDate;
}