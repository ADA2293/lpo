#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 
# Copyright 2015 <+YOU OR YOUR COMPANY+>.
# 
# This is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3, or (at your option)
# any later version.
# 
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this software; see the file COPYING.  If not, write to
# the Free Software Foundation, Inc., 51 Franklin Street,
# Boston, MA 02110-1301, USA.
# 

from gnuradio import gr, gr_unittest
from gnuradio import blocks
import frame_detection_swig as frame_detection

class qa_deinterleaver_bb (gr_unittest.TestCase):

    def setUp (self):
        self.tb = gr.top_block ()

    def tearDown (self):
        self.tb = None

    def test_001_t (self):
        src_data = (254, 1, 1, 0, 0, 255, 0, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(2,2,4)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_002_t (self):
        src_data = (0, 0, 0, 0, 254, 1, 1, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(2,2,4)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_003_t (self):
        src_data = (254, 1, 1, 0, 0, 1, 0, 1, 0)
        expected_result = (0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(2,2,8)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_004_t (self):
        src_data = (0, 0, 0, 0, 254, 1, 1, 0, 0, 1, 0, 1, 0, 1)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(3,3,9)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_005_t (self):
        src_data = (254, 1, 1, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 1, 0, 1, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(2,2,4)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)

    def test_006_t (self):
        src_data = (0, 0, 0, 254, 1, 1, 0, 0, 1, 0, 1, 0, 255, 0, 0, 0)
        expected_result = (0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0)
        src = blocks.vector_source_b(src_data)
        dst = blocks.vector_sink_b()
        deint = frame_detection.deinterleaver_bb(2,2,8)
        self.tb.connect(src, deint)
        self.tb.connect(deint, dst)        
        self.tb.run ()
        result_data = dst.data()
        self.assertEqual(expected_result, result_data)


if __name__ == '__main__':
    gr_unittest.run(qa_deinterleaver_bb, "qa_deinterleaver_bb.xml")
