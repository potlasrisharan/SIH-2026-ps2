package com.joker.kit.core.model.common

import kotlinx.serialization.Serializable

/**
 * ID数组
 *
 * @param ids 地址ID数组
 * @author Joker.X
 */
@Serializable
data class Ids(
    /**
     * 地址ID数组
     */
    val ids: List<Long>
)