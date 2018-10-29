package com.qxczh.common.base;


import com.qxczh.common.dto.QuarkResult;

@FunctionalInterface
public interface ResultProcessor {
    QuarkResult process();
}
