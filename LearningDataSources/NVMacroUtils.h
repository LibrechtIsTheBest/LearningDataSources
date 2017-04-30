#pragma once

#define nv_safe_block_call(block, ...) block ? block(__VA_ARGS__) : nil
#define nv_safe_block_call_return(block, fallback, ...) if (block) { return block(__VA_ARGS__); } else { return fallback; }

#define nv_weak(object_or_class) __weak __typeof__(object_or_class)
#define nv_strong(object_or_class) __strong __typeof__(object_or_class)

#define nv_define_weak_self(weakSelf) __weak __typeof__(self) weakSelf = self
#define nv_define_strong_self(strongSelf, weakSelf) __strong __typeof__(self) strongSelf = weakSelf
