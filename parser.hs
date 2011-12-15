{-# OPTIONS_GHC -fno-warn-overlapping-patterns #-}
{-# OPTIONS -fglasgow-exts -cpp #-}
module Parser where
import Lexer
#if __GLASGOW_HASKELL__ >= 503
import qualified Data.Array as Happy_Data_Array
#else
import qualified Array as Happy_Data_Array
#endif
#if __GLASGOW_HASKELL__ >= 503
import qualified GHC.Exts as Happy_GHC_Exts
#else
import qualified GlaExts as Happy_GHC_Exts
#endif

-- parser produced by Happy Version 1.18.4

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: (AST) -> (HappyAbsSyn )
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn ) -> (AST)
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: ([Statement]) -> (HappyAbsSyn )
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn ) -> ([Statement])
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: (Statement) -> (HappyAbsSyn )
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn ) -> (Statement)
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: (Exp) -> (HappyAbsSyn )
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn ) -> (Exp)
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: (Statement) -> (HappyAbsSyn )
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn ) -> (Statement)
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: (Statement) -> (HappyAbsSyn )
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn ) -> (Statement)
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: (MType) -> (HappyAbsSyn )
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn ) -> (MType)
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: (Statement) -> (HappyAbsSyn )
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn ) -> (Statement)
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: (Exp) -> (HappyAbsSyn )
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn ) -> (Exp)
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: (Statement) -> (HappyAbsSyn )
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn ) -> (Statement)
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyIn14 :: (Statement) -> (HappyAbsSyn )
happyIn14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn14 #-}
happyOut14 :: (HappyAbsSyn ) -> (Statement)
happyOut14 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut14 #-}
happyIn15 :: (Exp) -> (HappyAbsSyn )
happyIn15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn15 #-}
happyOut15 :: (HappyAbsSyn ) -> (Exp)
happyOut15 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut15 #-}
happyIn16 :: ([Exp]) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> ([Exp])
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
happyIn17 :: ([(String,MType)]) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> ([(String,MType)])
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
happyIn18 :: (Statement) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> (Statement)
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
happyIn19 :: (Exp) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> (Exp)
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
happyIn20 :: (Statement) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> (Statement)
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
happyIn21 :: (Statement) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> (Statement)
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
happyIn22 :: (Statement) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> (Statement)
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
happyIn23 :: (Conditional) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> (Conditional)
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
happyIn24 :: (Conditional) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> (Conditional)
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
happyIn25 :: (BoolExpr) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> (BoolExpr)
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
happyIn26 :: (Exp) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> (Exp)
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
happyIn27 :: (Exp) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> (Exp)
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
happyIn28 :: (Statement) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> (Statement)
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x3d\x00\x3d\x00\x00\x00\x3d\x00\x29\x00\x00\x00\x00\x00\x00\x00\x62\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x57\x00\x0e\x01\x1b\x01\x1a\x01\x57\x00\x11\x01\x0a\x01\xf7\x00\x57\x00\x57\x00\x78\x01\xee\x00\xef\x00\x57\x00\xe9\x00\xe0\x00\xdf\x00\x46\x00\x07\x00\xf6\x00\x07\x00\x00\x00\x64\x02\x18\x00\x64\x02\xde\x00\x07\x00\xd0\x00\x62\x02\x07\x00\x07\x00\xdb\x00\x56\x02\x00\x00\xc7\x00\xc0\x00\xbe\x00\x07\x00\x07\x00\x00\x00\xbf\x00\xb0\x00\x00\x00\x00\x00\x00\x00\x5d\x02\x5d\x02\xae\x00\x00\x00\x00\x00\x00\x00\x03\x00\x5b\x02\xba\x00\xb9\x00\x07\x00\xe5\xff\xb3\x00\xb6\x00\x07\x00\x7c\x01\xa6\x01\x4f\x02\xa9\x00\x6c\x00\x71\x00\x00\x00\x00\x00\x00\x00\x4a\x02\x00\x00\x00\x00\x90\x00\x00\x00\x00\x00\x00\x00\x8f\x00\x00\x00\x07\x00\x89\x00\x9d\x00\x5d\x00\xa6\x01\x8c\x00\x07\x00\x00\x00\x48\x02\x80\x00\x75\x00\x07\x00\x07\x00\x77\x00\x79\x00\xa6\x01\x00\x00\x70\x00\x76\x00\x53\x00\x3a\x02\x9b\x01\x3d\x00\x3d\x00\x00\x00\xf5\xff\x3d\x00\x3d\x00\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x00\x00\xab\x01\x00\x00\x65\x00\x48\x00\x5e\x00\x0d\x00\x07\x00\x07\x00\x03\x00\x6d\x00\x42\x00\x03\x00\xa6\x01\x00\x00\x67\x00\x00\x00\x3a\x00\x00\x00\x6b\x00\x00\x00\x00\x00\x23\x00\x00\x00\x00\x00\x66\x00\x00\x00\x00\x00\x00\x00\x4e\x00\x00\x00\x3d\x00\x00\x00\x5f\x00\x07\x00\x43\x00\x00\x00\x38\x00\x3d\x00\x39\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x95\x00\x55\x01\x00\x00\x3d\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x54\x02\x00\x00\x00\x00\x00\x00\x4e\x02\x00\x00\x00\x00\x00\x00\x44\x02\x3e\x02\x00\x00\x00\x00\x00\x00\x34\x02\x00\x00\x00\x00\x00\x00\x2e\x02\xde\x01\x00\x00\x24\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\x01\x00\x00\x00\x00\xc5\x01\xb5\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x1e\x02\x14\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x5a\x00\x00\x00\x00\x00\x00\x00\x0e\x02\x00\x00\x00\x00\x00\x00\x04\x02\x00\x00\x4b\x00\x00\x00\x00\x00\x49\x00\x45\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xaf\x01\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\xfe\x01\x00\x00\x00\x00\x00\x00\x00\x00\xf4\x01\xee\x01\x00\x00\x00\x00\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x25\x01\x0d\x01\x00\x00\x00\x00\xf5\x00\x6c\x01\x00\x00\xe4\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x24\x00\x00\x00\x00\x00\x21\x00\x9f\x01\x96\x01\x37\x00\x00\x00\x00\x00\x15\x00\x1b\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc5\x00\x00\x00\x0b\x00\x86\x01\x00\x00\x00\x00\x00\x00\xad\x00\xf7\xff\x00\x00\x00\x00"#

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xfd\xff\x00\x00\xfe\xff\xfd\xff\xdf\xff\xfb\xff\xfa\xff\xf9\xff\x00\x00\xf5\xff\xef\xff\xdc\xff\xf1\xff\xdb\xff\xf8\xff\xf3\xff\xf6\xff\xf4\xff\xe1\xff\xe0\xff\xf2\xff\xed\xff\xec\xff\xee\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xde\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdf\xff\xb6\xff\xde\xff\xb5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb4\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf0\xff\x00\x00\x00\x00\xfc\xff\xcd\xff\xcb\xff\xb8\xff\xb9\xff\x00\x00\xc9\xff\xca\xff\xd8\xff\x00\x00\xbe\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd5\xff\x00\x00\x00\x00\xde\xff\xce\xff\xe3\xff\xe2\xff\x00\x00\xcc\xff\xe8\xff\x00\x00\xe5\xff\xe6\xff\xe4\xff\x00\x00\xd7\xff\x00\x00\x00\x00\xdd\xff\x00\x00\x00\x00\x00\x00\x00\x00\xc8\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcf\xff\x00\x00\x00\x00\xd3\xff\xb8\xff\xb9\xff\xfd\xff\xfd\xff\xb7\xff\x00\x00\xfd\xff\x00\x00\xdd\xff\x00\x00\xeb\xff\xd6\xff\xea\xff\xe9\xff\x00\x00\xd0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\x00\x00\x00\x00\xd4\xff\xb8\xff\xba\xff\xb9\xff\xbb\xff\x00\x00\xc4\xff\xc5\xff\xfd\xff\xc6\xff\xc7\xff\x00\x00\xe7\xff\xc2\xff\xc1\xff\x00\x00\xc3\xff\xfd\xff\xd2\xff\xda\xff\x00\x00\x00\x00\xd9\xff\x00\x00\xfd\xff\xc0\xff\xbf\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x1c\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x01\x00\x02\x00\x03\x00\x14\x00\x09\x00\x0a\x00\x0b\x00\x2a\x00\x1b\x00\x10\x00\x05\x00\x06\x00\x13\x00\x0a\x00\x15\x00\x16\x00\x17\x00\x24\x00\x19\x00\x06\x00\x27\x00\x28\x00\x17\x00\x1e\x00\x1f\x00\x06\x00\x0d\x00\x22\x00\x01\x00\x02\x00\x03\x00\x04\x00\x27\x00\x26\x00\x29\x00\x1e\x00\x2b\x00\x2c\x00\x27\x00\x17\x00\x29\x00\x08\x00\x2b\x00\x10\x00\x1c\x00\x14\x00\x13\x00\x06\x00\x14\x00\x16\x00\x17\x00\x12\x00\x19\x00\x06\x00\x01\x00\x02\x00\x03\x00\x04\x00\x1f\x00\x20\x00\x0d\x00\x22\x00\x06\x00\x01\x00\x02\x00\x03\x00\x27\x00\x06\x00\x29\x00\x10\x00\x2b\x00\x06\x00\x13\x00\x06\x00\x18\x00\x16\x00\x17\x00\x1d\x00\x19\x00\x1e\x00\x01\x00\x02\x00\x03\x00\x18\x00\x1f\x00\x17\x00\x24\x00\x22\x00\x06\x00\x27\x00\x28\x00\x04\x00\x27\x00\x17\x00\x29\x00\x0d\x00\x2b\x00\x07\x00\x08\x00\x05\x00\x2a\x00\x27\x00\x17\x00\x29\x00\x05\x00\x2b\x00\x2a\x00\x15\x00\x12\x00\x09\x00\x0a\x00\x0b\x00\x1b\x00\x0c\x00\x09\x00\x0a\x00\x0b\x00\x2a\x00\x27\x00\x18\x00\x29\x00\x24\x00\x2b\x00\x1e\x00\x27\x00\x28\x00\x24\x00\x11\x00\x17\x00\x27\x00\x28\x00\x24\x00\x2a\x00\x1c\x00\x27\x00\x28\x00\x24\x00\x18\x00\x1d\x00\x27\x00\x28\x00\x00\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x2b\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x21\x00\x2b\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x1d\x00\x0d\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x2a\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x2a\x00\x2a\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x18\x00\x0c\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x18\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x18\x00\x18\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2b\x00\x2a\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x25\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x2a\x00\x2a\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2a\x00\x17\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x2b\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x23\x00\x0c\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2a\x00\x2a\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x2a\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x2a\x00\x2c\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x17\x00\x2b\x00\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\x1a\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x17\x00\x17\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x2b\x00\xff\xff\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\xff\xff\x16\x00\x17\x00\x18\x00\x01\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\xff\xff\xff\xff\x16\x00\x17\x00\x18\x00\x02\x00\x03\x00\x04\x00\x05\x00\xff\xff\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\xff\xff\xff\xff\x0e\x00\x0f\x00\x10\x00\x11\x00\x12\x00\x13\x00\x08\x00\xff\xff\x16\x00\x17\x00\x18\x00\x0d\x00\x0e\x00\x0f\x00\xff\xff\x03\x00\x12\x00\xff\xff\x14\x00\xff\xff\x08\x00\x17\x00\xff\xff\x0b\x00\x1a\x00\xff\xff\x1c\x00\x0f\x00\xff\xff\x1b\x00\xff\xff\x03\x00\xff\xff\x15\x00\x16\x00\x17\x00\x08\x00\xff\xff\x24\x00\x0b\x00\x03\x00\x27\x00\x28\x00\x0f\x00\xff\xff\x08\x00\xff\xff\xff\xff\x0b\x00\x15\x00\x16\x00\x17\x00\x0f\x00\x09\x00\x0a\x00\x0b\x00\x03\x00\x18\x00\x15\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\x08\x00\x0f\x00\x24\x00\x0b\x00\xff\xff\x27\x00\x28\x00\x0f\x00\x16\x00\x17\x00\xff\xff\x03\x00\xff\xff\x15\x00\x16\x00\x17\x00\x08\x00\xff\xff\x24\x00\x0b\x00\x03\x00\x27\x00\x28\x00\x0f\x00\x2a\x00\x08\x00\xff\xff\xff\xff\x0b\x00\x15\x00\x16\x00\x17\x00\x0f\x00\xff\xff\xff\xff\xff\xff\x03\x00\xff\xff\x15\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x0c\x00\xff\xff\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\xff\xff\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\xff\xff\x0b\x00\xff\xff\x03\x00\x18\x00\x0f\x00\x16\x00\x17\x00\x08\x00\x03\x00\xff\xff\x0b\x00\x16\x00\x17\x00\x08\x00\x0f\x00\x24\x00\x0b\x00\x18\x00\x27\x00\x28\x00\x0f\x00\x16\x00\x17\x00\xff\xff\xff\xff\xff\xff\xff\xff\x16\x00\x17\x00\x24\x00\xff\xff\x24\x00\x27\x00\x28\x00\x27\x00\x28\x00\x24\x00\x2a\x00\xff\xff\x27\x00\x28\x00\xff\xff\x2a\x00\x24\x00\xff\xff\xff\xff\x27\x00\x28\x00\x24\x00\x2a\x00\x24\x00\x27\x00\x28\x00\x27\x00\x28\x00\x24\x00\xff\xff\x24\x00\x27\x00\x28\x00\x27\x00\x28\x00\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x6d\x00\xf3\xff\xf3\xff\xf3\xff\xf3\xff\xf3\xff\xf3\xff\x16\x00\x17\x00\x18\x00\xaf\x00\x62\x00\x63\x00\x64\x00\x6e\x00\x8c\x00\xf3\xff\x9c\x00\x9d\x00\xf3\xff\xab\x00\xf3\xff\xf3\xff\xf3\xff\x3d\x00\xf3\xff\x73\x00\x3e\x00\x3f\x00\x1d\x00\xf3\xff\xf3\xff\xa6\x00\xa7\x00\xf3\xff\x16\x00\x17\x00\x18\x00\x19\x00\xf3\xff\x76\x00\xf3\xff\x9e\x00\xf3\xff\xf3\xff\x21\x00\x2b\x00\x22\x00\x41\x00\x30\x00\x1a\x00\x54\x00\x9a\x00\x1b\x00\x77\x00\xa0\x00\x1c\x00\x1d\x00\x42\x00\x1e\x00\x73\x00\x16\x00\x17\x00\x18\x00\x19\x00\x1f\x00\xa5\x00\x95\x00\x20\x00\x81\x00\x16\x00\x17\x00\x18\x00\x21\x00\x60\x00\x22\x00\x1a\x00\x23\x00\x64\x00\x1b\x00\x67\x00\xb9\xff\x1c\x00\x1d\x00\xae\x00\x1e\x00\x9e\x00\x16\x00\x17\x00\x18\x00\xad\x00\x1f\x00\x1d\x00\x3d\x00\x20\x00\x73\x00\x72\x00\x73\x00\x19\x00\x21\x00\xaa\x00\x22\x00\x74\x00\x23\x00\x3a\x00\x3b\x00\xa3\x00\x94\x00\x21\x00\x1d\x00\x22\x00\xa6\x00\x5a\x00\xa0\x00\x9f\x00\x3c\x00\x62\x00\x63\x00\x64\x00\x83\x00\x95\x00\x62\x00\x63\x00\x64\x00\x91\x00\x21\x00\xb8\xff\x22\x00\x3d\x00\x30\x00\x9e\x00\x3e\x00\x3f\x00\x3d\x00\x92\x00\x2b\x00\x3e\x00\x3f\x00\x3d\x00\x40\x00\x54\x00\x72\x00\x73\x00\x3d\x00\x79\x00\x7d\x00\x3e\x00\x3f\x00\x23\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x93\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x7e\x00\x7a\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x81\x00\x84\x00\x12\x00\x13\x00\x14\x00\xae\x00\x03\x00\x04\x00\x05\x00\x06\x00\x85\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x87\x00\x88\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x66\x00\x6b\x00\x12\x00\x13\x00\x14\x00\xa8\x00\x03\x00\x04\x00\x05\x00\x06\x00\x6c\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x70\x00\x71\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x77\x00\x44\x00\x12\x00\x13\x00\x14\x00\xa3\x00\x03\x00\x04\x00\x05\x00\x06\x00\x48\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x45\x00\x49\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x4a\x00\x4c\x00\x12\x00\x13\x00\x14\x00\x8a\x00\x03\x00\x04\x00\x05\x00\x06\x00\x51\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x53\x00\x56\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x5b\x00\x5c\x00\x12\x00\x13\x00\x14\x00\x8c\x00\x03\x00\x04\x00\x05\x00\x06\x00\x5d\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x5f\x00\xff\xff\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x33\x00\x32\x00\x12\x00\x13\x00\x14\x00\x8d\x00\x03\x00\x04\x00\x05\x00\x06\x00\x34\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x36\x00\x37\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x38\x00\x00\x00\x12\x00\x13\x00\x14\x00\x42\x00\x03\x00\x04\x00\x05\x00\x06\x00\x00\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x00\x00\x00\x00\x12\x00\x13\x00\x14\x00\x02\x00\x03\x00\x04\x00\x05\x00\x06\x00\x00\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x00\x00\x00\x00\x12\x00\x13\x00\x14\x00\x89\x00\x04\x00\x05\x00\x06\x00\x00\x00\x07\x00\x08\x00\x09\x00\x0a\x00\x0b\x00\x00\x00\x00\x00\x0c\x00\x0d\x00\x0e\x00\x0f\x00\x10\x00\x11\x00\x25\x00\x00\x00\x12\x00\x13\x00\x14\x00\x26\x00\x27\x00\x28\x00\x00\x00\x2d\x00\x29\x00\x00\x00\x2a\x00\x00\x00\x4c\x00\x2b\x00\x00\x00\x0b\x00\x2c\x00\x00\x00\x2d\x00\x0d\x00\x00\x00\x69\x00\x00\x00\x2d\x00\x00\x00\xaa\x00\x12\x00\x13\x00\x96\x00\x00\x00\x3d\x00\x0b\x00\x2d\x00\x3e\x00\x3f\x00\x0d\x00\x00\x00\x98\x00\x00\x00\x00\x00\x0b\x00\x97\x00\x12\x00\x13\x00\x0d\x00\x62\x00\x63\x00\x64\x00\x2d\x00\xb9\xff\x99\x00\x12\x00\x13\x00\x56\x00\x2d\x00\x00\x00\x0b\x00\x85\x00\x00\x00\x4c\x00\x0d\x00\x3d\x00\x0b\x00\x00\x00\x8f\x00\x3f\x00\x0d\x00\x12\x00\x13\x00\x00\x00\x2d\x00\x00\x00\x4d\x00\x12\x00\x13\x00\x4c\x00\x00\x00\x3d\x00\x0b\x00\x2d\x00\x3e\x00\x3f\x00\x0d\x00\xa2\x00\x4c\x00\x00\x00\x00\x00\x0b\x00\x4e\x00\x12\x00\x13\x00\x0d\x00\x00\x00\x00\x00\x00\x00\x2d\x00\x00\x00\x51\x00\x12\x00\x13\x00\x56\x00\x2d\x00\x00\x00\x0b\x00\x57\x00\x00\x00\x88\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x7a\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x7b\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x7f\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x69\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x6e\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x45\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x46\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x54\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x58\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x5d\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\x00\x00\x0d\x00\x12\x00\x13\x00\x2e\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x30\x00\x0d\x00\x00\x00\x0b\x00\x00\x00\x2d\x00\xb8\xff\x0d\x00\x12\x00\x13\x00\x34\x00\x2d\x00\x00\x00\x0b\x00\x12\x00\x13\x00\x38\x00\x0d\x00\x3d\x00\x0b\x00\x7f\x00\x3e\x00\x90\x00\x0d\x00\x12\x00\x13\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12\x00\x13\x00\x3d\x00\x00\x00\x3d\x00\x3e\x00\x3f\x00\x3e\x00\x3f\x00\x3d\x00\x60\x00\x00\x00\x3e\x00\x3f\x00\x00\x00\x67\x00\x3d\x00\x00\x00\x00\x00\x3e\x00\x3f\x00\x3d\x00\x4b\x00\x3d\x00\x72\x00\x73\x00\x3e\x00\x3f\x00\x3d\x00\x00\x00\x3d\x00\x50\x00\x3f\x00\x3e\x00\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 75) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71),
	(72 , happyReduce_72),
	(73 , happyReduce_73),
	(74 , happyReduce_74),
	(75 , happyReduce_75)
	]

happy_n_terms = 45 :: Int
happy_n_nonterms = 25 :: Int

happyReduce_1 = happySpecReduce_1  0# happyReduction_1
happyReduction_1 happy_x_1
	 =  case happyOut5 happy_x_1 of { happy_var_1 -> 
	happyIn4
		 (Program happy_var_1
	)}

happyReduce_2 = happySpecReduce_0  1# happyReduction_2
happyReduction_2  =  happyIn5
		 ([]
	)

happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 ([happy_var_1] ++ happy_var_2
	)}}

happyReduce_4 = happySpecReduce_1  2# happyReduction_4
happyReduction_4 happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_5 = happySpecReduce_1  2# happyReduction_5
happyReduction_5 happy_x_1
	 =  case happyOut9 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_6 = happySpecReduce_1  2# happyReduction_6
happyReduction_6 happy_x_1
	 =  case happyOut11 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_7 = happySpecReduce_1  2# happyReduction_7
happyReduction_7 happy_x_1
	 =  case happyOut20 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_8 = happySpecReduce_1  2# happyReduction_8
happyReduction_8 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_9 = happySpecReduce_1  2# happyReduction_9
happyReduction_9 happy_x_1
	 =  case happyOut22 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_10 = happySpecReduce_1  2# happyReduction_10
happyReduction_10 happy_x_1
	 =  case happyOut13 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_11 = happySpecReduce_1  2# happyReduction_11
happyReduction_11 happy_x_1
	 =  case happyOut23 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (Conditional happy_var_1
	)}

happyReduce_12 = happySpecReduce_1  2# happyReduction_12
happyReduction_12 happy_x_1
	 =  case happyOut21 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_13 = happySpecReduce_1  2# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOut28 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_14 = happySpecReduce_1  2# happyReduction_14
happyReduction_14 happy_x_1
	 =  case happyOut18 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_15 = happySpecReduce_2  2# happyReduction_15
happyReduction_15 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (LExp happy_var_1
	)}

happyReduce_16 = happySpecReduce_1  2# happyReduction_16
happyReduction_16 happy_x_1
	 =  case happyOut14 happy_x_1 of { happy_var_1 -> 
	happyIn6
		 (happy_var_1
	)}

happyReduce_17 = happySpecReduce_1  3# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOutTok happy_x_1 of { (LString happy_var_1) -> 
	happyIn7
		 (String happy_var_1
	)}

happyReduce_18 = happySpecReduce_1  3# happyReduction_18
happyReduction_18 happy_x_1
	 =  case happyOutTok happy_x_1 of { (LInt happy_var_1) -> 
	happyIn7
		 (Int happy_var_1
	)}

happyReduce_19 = happySpecReduce_1  3# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOutTok happy_x_1 of { (LChar happy_var_1) -> 
	happyIn7
		 (Char happy_var_1
	)}

happyReduce_20 = happyReduce 5# 4# happyReduction_20
happyReduction_20 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut10 happy_x_4 of { happy_var_4 -> 
	happyIn8
		 (Declare happy_var_4 happy_var_1
	) `HappyStk` happyRest}}

happyReduce_21 = happyReduce 5# 4# happyReduction_21
happyReduction_21 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut10 happy_x_4 of { happy_var_4 -> 
	happyIn8
		 (DeclareArray happy_var_3 happy_var_4 happy_var_1
	) `HappyStk` happyRest}}}

happyReduce_22 = happyReduce 5# 4# happyReduction_22
happyReduction_22 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOutTok happy_x_3 of { (Id happy_var_3) -> 
	case happyOut10 happy_x_4 of { happy_var_4 -> 
	happyIn8
		 (DeclareArray (SizeOfArray happy_var_3) happy_var_4 happy_var_1
	) `HappyStk` happyRest}}}

happyReduce_23 = happyReduce 4# 5# happyReduction_23
happyReduction_23 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn9
		 (Assign happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_24 = happyReduce 7# 5# happyReduction_24
happyReduction_24 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOut12 happy_x_6 of { happy_var_6 -> 
	happyIn9
		 (ArraySetElem happy_var_1 happy_var_3 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_25 = happySpecReduce_1  6# happyReduction_25
happyReduction_25 happy_x_1
	 =  happyIn10
		 (MLett
	)

happyReduce_26 = happySpecReduce_1  6# happyReduction_26
happyReduction_26 happy_x_1
	 =  happyIn10
		 (MNum
	)

happyReduce_27 = happySpecReduce_1  6# happyReduction_27
happyReduction_27 happy_x_1
	 =  happyIn10
		 (MSent
	)

happyReduce_28 = happySpecReduce_3  7# happyReduction_28
happyReduction_28 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	happyIn11
		 (Decr happy_var_1
	)}

happyReduce_29 = happySpecReduce_3  7# happyReduction_29
happyReduction_29 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	happyIn11
		 (Incr happy_var_1
	)}

happyReduce_30 = happySpecReduce_1  8# happyReduction_30
happyReduction_30 happy_x_1
	 =  case happyOut26 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_31 = happySpecReduce_1  8# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOut27 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_32 = happySpecReduce_1  8# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_33 = happySpecReduce_1  8# happyReduction_33
happyReduction_33 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	happyIn12
		 (Var happy_var_1
	)}

happyReduce_34 = happyReduce 4# 8# happyReduction_34
happyReduction_34 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn12
		 (ArrayGetElem happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_35 = happySpecReduce_1  8# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOut15 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_36 = happySpecReduce_1  8# happyReduction_36
happyReduction_36 happy_x_1
	 =  case happyOut19 happy_x_1 of { happy_var_1 -> 
	happyIn12
		 (happy_var_1
	)}

happyReduce_37 = happyReduce 9# 9# happyReduction_37
happyReduction_37 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Id happy_var_2) -> 
	case happyOut17 happy_x_4 of { happy_var_4 -> 
	case happyOut10 happy_x_8 of { happy_var_8 -> 
	case happyOut5 happy_x_9 of { happy_var_9 -> 
	happyIn13
		 (Function happy_var_8 happy_var_2 happy_var_4 happy_var_9
	) `HappyStk` happyRest}}}}

happyReduce_38 = happyReduce 10# 9# happyReduction_38
happyReduction_38 (happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Id happy_var_2) -> 
	case happyOut17 happy_x_4 of { happy_var_4 -> 
	case happyOut10 happy_x_8 of { happy_var_8 -> 
	case happyOut5 happy_x_9 of { happy_var_9 -> 
	case happyOut14 happy_x_10 of { happy_var_10 -> 
	happyIn13
		 (Function happy_var_8 happy_var_2 happy_var_4 (happy_var_9++[happy_var_10])
	) `HappyStk` happyRest}}}}}

happyReduce_39 = happySpecReduce_3  10# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn14
		 (Return happy_var_2
	)}

happyReduce_40 = happyReduce 4# 11# happyReduction_40
happyReduction_40 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn15
		 (Call happy_var_1 happy_var_3
	) `HappyStk` happyRest}}

happyReduce_41 = happySpecReduce_3  12# happyReduction_41
happyReduction_41 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut16 happy_x_3 of { happy_var_3 -> 
	happyIn16
		 ([happy_var_1] ++ happy_var_3
	)}}

happyReduce_42 = happySpecReduce_1  12# happyReduction_42
happyReduction_42 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn16
		 ([happy_var_1]
	)}

happyReduce_43 = happyReduce 4# 13# happyReduction_43
happyReduction_43 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (Id happy_var_2) -> 
	case happyOut17 happy_x_4 of { happy_var_4 -> 
	happyIn17
		 ([(happy_var_2,happy_var_1)] ++ happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_44 = happySpecReduce_2  13# happyReduction_44
happyReduction_44 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (Id happy_var_2) -> 
	happyIn17
		 ([(happy_var_2,happy_var_1)]
	)}}

happyReduce_45 = happyReduce 5# 13# happyReduction_45
happyReduction_45 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut10 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { (Id happy_var_3) -> 
	case happyOut17 happy_x_5 of { happy_var_5 -> 
	happyIn17
		 ([(happy_var_3,happy_var_2)] ++ happy_var_5
	) `HappyStk` happyRest}}}

happyReduce_46 = happySpecReduce_3  13# happyReduction_46
happyReduction_46 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { (Id happy_var_3) -> 
	happyIn17
		 ([(happy_var_3,happy_var_2)]
	)}}

happyReduce_47 = happyReduce 6# 14# happyReduction_47
happyReduction_47 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_2 of { (Id happy_var_2) -> 
	case happyOut10 happy_x_5 of { happy_var_5 -> 
	case happyOut6 happy_x_6 of { happy_var_6 -> 
	happyIn18
		 (Function happy_var_5 happy_var_2 [("param",happy_var_5)] [happy_var_6]
	) `HappyStk` happyRest}}}

happyReduce_48 = happyReduce 4# 15# happyReduction_48
happyReduction_48 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_4 of { (Id happy_var_4) -> 
	happyIn19
		 (Call happy_var_4 [happy_var_1]
	) `HappyStk` happyRest}}

happyReduce_49 = happySpecReduce_3  16# happyReduction_49
happyReduction_49 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	happyIn20
		 (Print (Var happy_var_1)
	)}

happyReduce_50 = happySpecReduce_3  16# happyReduction_50
happyReduction_50 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (Print happy_var_1
	)}

happyReduce_51 = happySpecReduce_3  16# happyReduction_51
happyReduction_51 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Id happy_var_1) -> 
	happyIn20
		 (Print (Var happy_var_1)
	)}

happyReduce_52 = happySpecReduce_3  16# happyReduction_52
happyReduction_52 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut7 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (Print happy_var_1
	)}

happyReduce_53 = happySpecReduce_3  16# happyReduction_53
happyReduction_53 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (Print happy_var_1
	)}

happyReduce_54 = happySpecReduce_3  16# happyReduction_54
happyReduction_54 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn20
		 (Print happy_var_1
	)}

happyReduce_55 = happyReduce 4# 17# happyReduction_55
happyReduction_55 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (Id happy_var_3) -> 
	happyIn21
		 (ReadIn happy_var_3
	) `HappyStk` happyRest}

happyReduce_56 = happyReduce 7# 17# happyReduction_56
happyReduction_56 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOutTok happy_x_3 of { (Id happy_var_3) -> 
	happyIn21
		 (ReadIn happy_var_3
	) `HappyStk` happyRest}

happyReduce_57 = happyReduce 7# 18# happyReduction_57
happyReduction_57 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_6 of { happy_var_6 -> 
	happyIn22
		 (WhileNot happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_58 = happyReduce 7# 19# happyReduction_58
happyReduction_58 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_6 of { happy_var_6 -> 
	happyIn23
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_59 = happyReduce 7# 19# happyReduction_59
happyReduction_59 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_6 of { happy_var_6 -> 
	happyIn23
		 (If happy_var_3 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_60 = happyReduce 8# 19# happyReduction_60
happyReduction_60 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_6 of { happy_var_6 -> 
	case happyOut24 happy_x_7 of { happy_var_7 -> 
	happyIn23
		 (IfE happy_var_3 happy_var_6 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_61 = happyReduce 8# 19# happyReduction_61
happyReduction_61 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_3 of { happy_var_3 -> 
	case happyOut5 happy_x_6 of { happy_var_6 -> 
	case happyOut24 happy_x_7 of { happy_var_7 -> 
	happyIn23
		 (IfE happy_var_3 happy_var_6 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_62 = happySpecReduce_2  20# happyReduction_62
happyReduction_62 happy_x_2
	happy_x_1
	 =  case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn24
		 (Else happy_var_2
	)}

happyReduce_63 = happyReduce 7# 20# happyReduction_63
happyReduction_63 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_4 of { happy_var_4 -> 
	case happyOut5 happy_x_7 of { happy_var_7 -> 
	happyIn24
		 (ElseIf happy_var_4 happy_var_7
	) `HappyStk` happyRest}}

happyReduce_64 = happyReduce 8# 20# happyReduction_64
happyReduction_64 (happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut25 happy_x_4 of { happy_var_4 -> 
	case happyOut5 happy_x_7 of { happy_var_7 -> 
	case happyOut24 happy_x_8 of { happy_var_8 -> 
	happyIn24
		 (ElseIfE happy_var_4 happy_var_7 happy_var_8
	) `HappyStk` happyRest}}}

happyReduce_65 = happySpecReduce_1  21# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn25
		 (SBoolExpr happy_var_1
	)}

happyReduce_66 = happySpecReduce_3  21# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (DBinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn25
		 (DBoolExpr happy_var_1 happy_var_2 happy_var_3
	)}}}

happyReduce_67 = happySpecReduce_3  21# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (BinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn25
		 (DBoolExpr happy_var_1 [happy_var_2] happy_var_3
	)}}}

happyReduce_68 = happyReduce 5# 21# happyReduction_68
happyReduction_68 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (BinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOutTok happy_x_4 of { (BinOp happy_var_4) -> 
	case happyOut25 happy_x_5 of { happy_var_5 -> 
	happyIn25
		 (CBoolExpr (DBoolExpr happy_var_1 [happy_var_2] happy_var_3) [happy_var_4] happy_var_5
	) `HappyStk` happyRest}}}}}

happyReduce_69 = happyReduce 5# 21# happyReduction_69
happyReduction_69 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (DBinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	case happyOutTok happy_x_4 of { (DBinOp happy_var_4) -> 
	case happyOut25 happy_x_5 of { happy_var_5 -> 
	happyIn25
		 (CBoolExpr (DBoolExpr happy_var_1 happy_var_2 happy_var_3) happy_var_4 happy_var_5
	) `HappyStk` happyRest}}}}}

happyReduce_70 = happySpecReduce_3  22# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (BinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn26
		 (BinOpr happy_var_2 happy_var_1 happy_var_3
	)}}}

happyReduce_71 = happySpecReduce_3  22# happyReduction_71
happyReduction_71 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOutTok happy_x_2 of { (DBinOp happy_var_2) -> 
	case happyOut12 happy_x_3 of { happy_var_3 -> 
	happyIn26
		 (DBinOpr happy_var_2 happy_var_1 happy_var_3
	)}}}

happyReduce_72 = happyReduce 5# 22# happyReduction_72
happyReduction_72 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut12 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { (BinOp happy_var_3) -> 
	case happyOut12 happy_x_4 of { happy_var_4 -> 
	happyIn26
		 (BinOpr happy_var_3 happy_var_2 happy_var_4
	) `HappyStk` happyRest}}}

happyReduce_73 = happySpecReduce_2  23# happyReduction_73
happyReduction_73 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (UnOp happy_var_1) -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn27
		 (UnOpr happy_var_1 happy_var_2
	)}}

happyReduce_74 = happySpecReduce_2  23# happyReduction_74
happyReduction_74 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (BinOp happy_var_1) -> 
	case happyOut12 happy_x_2 of { happy_var_2 -> 
	happyIn27
		 (UnOpr happy_var_1 happy_var_2
	)}}

happyReduce_75 = happySpecReduce_2  24# happyReduction_75
happyReduction_75 happy_x_2
	happy_x_1
	 =  happyIn28
		 (Skip
	)

happyNewToken action sts stk [] =
	happyDoAction 44# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	LInt happy_dollar_dollar -> cont 1#;
	LChar happy_dollar_dollar -> cont 2#;
	LString happy_dollar_dollar -> cont 3#;
	AliceFound -> cont 4#;
	AliceUnsureW -> cont 5#;
	AliceUnsure -> cont 6#;
	ThoughtAlice -> cont 7#;
	Spoke -> cont 8#;
	Number -> cont 9#;
	Letter -> cont 10#;
	Sentence -> cont 11#;
	Aa -> cont 12#;
	Became -> cont 13#;
	Drank -> cont 14#;
	Ate -> cont 15#;
	TheRoom -> cont 16#;
	Contained -> cont 17#;
	SaidAlice -> cont 18#;
	Perhaps -> cont 19#;
	Had -> cont 20#;
	EnoughTimes -> cont 21#;
	Eventually -> cont 22#;
	OBracket -> cont 23#;
	CBracket -> cont 24#;
	What -> cont 25#;
	Was -> cont 26#;
	Piece -> cont 27#;
	ICommaS -> cont 28#;
	So -> cont 29#;
	Or -> cont 30#;
	Either -> cont 31#;
	Maybe -> cont 32#;
	Because -> cont 33#;
	LookingGlass -> cont 34#;
	Changed -> cont 35#;
	Went -> cont 36#;
	Through -> cont 37#;
	Spider -> cont 38#;
	BinOp happy_dollar_dollar -> cont 39#;
	DBinOp happy_dollar_dollar -> cont 40#;
	UnOp happy_dollar_dollar -> cont 41#;
	Separator -> cont 42#;
	Id happy_dollar_dollar -> cont 43#;
	_ -> happyError' (tk:tks)
	}

happyError_ tk tks = happyError' (tk:tks)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Monad HappyIdentity where
    return = HappyIdentity
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => [(Token)] -> HappyIdentity a
happyError' = HappyIdentity . parseError

maliceParser tks = happyRunIdentity happySomeParser where
  happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (happyOut4 x))

happySeq = happyDontSeq


data MType
    = MSent | MLett | MNum
    deriving (Eq,Show)

data AST
    = Program [Statement]
    deriving (Show, Eq)

data Statement
    = Assign String Exp
    | Declare MType String
    | Decr String
    | Incr String
    | Return Exp
    | Print Exp
    | ReadIn String
    | Conditional Conditional
    | WhileNot BoolExpr [Statement]
    | Function MType String [(String,MType)] [Statement]
    | DeclareArray Exp MType String
    | ArraySetElem String Exp Exp
    | Skip
    | LExp Exp
    deriving (Show, Eq) 

data Conditional
    = If BoolExpr [Statement]
    | IfE BoolExpr [Statement] Conditional
    | ElseIf BoolExpr [Statement]
    | ElseIfE BoolExpr [Statement] Conditional
    | Else [Statement]
    deriving (Show, Eq)

data Exp
    = UnOpr Char Exp
    | BinOpr Char Exp Exp
    | DBinOpr String Exp Exp
    | Int Int
    | Char Char
    | String String
    | Var String
    | ArrayGetElem String Exp
    | Call String [Exp]
    | SizeOfArray String
    deriving (Show, Eq)

data BoolExpr
    = Bool Bool
    | DBoolExpr Exp String Exp
    | SBoolExpr Exp
    | CBoolExpr BoolExpr String BoolExpr
    deriving (Eq, Show)

parseError :: [Token] -> a
parseError t = error (show t)

tokensToString :: [Token] -> String -> String
tokensToString [] s     = s
tokensToString (x:xs) s = (tokensToString xs s) ++ (show x) ++ " " ++ s
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 

{-# LINE 28 "templates/GenericTemplate.hs" #-}


data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList





{-# LINE 49 "templates/GenericTemplate.hs" #-}

{-# LINE 59 "templates/GenericTemplate.hs" #-}

{-# LINE 68 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 0#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
	happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
	(happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
	= {- nothing -}


	  case action of
		0#		  -> {- nothing -}
				     happyFail i tk st
		-1# 	  -> {- nothing -}
				     happyAccept i tk st
		n | (n Happy_GHC_Exts.<# (0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}

				     (happyReduceArr Happy_Data_Array.! rule) i tk st
				     where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
		n		  -> {- nothing -}


				     happyShift new_state i tk st
				     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = indexShortOffAddr happyActOffsets st
	 off_i  = (off Happy_GHC_Exts.+# i)
	 check  = if (off_i Happy_GHC_Exts.>=# (0# :: Happy_GHC_Exts.Int#))
			then (indexShortOffAddr happyCheck off_i Happy_GHC_Exts.==#  i)
			else False
 	 action | check     = indexShortOffAddr happyTable off_i
		| otherwise = indexShortOffAddr happyDefActions st

{-# LINE 127 "templates/GenericTemplate.hs" #-}


indexShortOffAddr (HappyA# arr) off =
#if __GLASGOW_HASKELL__ > 500
	Happy_GHC_Exts.narrow16Int# i
#elif __GLASGOW_HASKELL__ == 500
	Happy_GHC_Exts.intToInt16# i
#else
	Happy_GHC_Exts.iShiftRA# (Happy_GHC_Exts.iShiftL# i 16#) 16#
#endif
  where
#if __GLASGOW_HASKELL__ >= 503
	i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
#else
	i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.shiftL# high 8#) low)
#endif
	high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
	low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
	off' = off Happy_GHC_Exts.*# 2#





data HappyAddr = HappyA# Happy_GHC_Exts.Addr#




-----------------------------------------------------------------------------
-- HappyState data type (not arrays)

{-# LINE 170 "templates/GenericTemplate.hs" #-}

-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
	 sts1@((HappyCons (st1@(action)) (_))) ->
        	let r = fn stk in  -- it doesn't hurt to always seq here...
       		happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
        happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))
       where sts1@((HappyCons (st1@(action)) (_))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
       happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))
       where sts1@((HappyCons (st1@(action)) (_))) = happyDrop k (HappyCons (st) (sts))
             drop_stk = happyDropStk k stk

             off    = indexShortOffAddr happyGotoOffsets st1
             off_i  = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off    = indexShortOffAddr happyGotoOffsets st
	 off_i  = (off Happy_GHC_Exts.+# nt)
 	 new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (0# is the error token)

-- parse error if we are in recovery and we fail again
happyFail  0# tk old_st _ stk =
--	trace "failing" $ 
    	happyError_ tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  0# tk old_st (HappyCons ((action)) (sts)) 
						(saved_tok `HappyStk` _ `HappyStk` stk) =
--	trace ("discarding state, depth " ++ show (length stk))  $
	happyDoAction 0# tk action sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail  i tk (action) sts stk =
--      trace "entering error recovery" $
	happyDoAction 0# tk action sts ( (Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--	happySeq = happyDoSeq
-- otherwise it emits
-- 	happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
