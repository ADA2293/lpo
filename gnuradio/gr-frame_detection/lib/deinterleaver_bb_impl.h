/* -*- c++ -*- */
/* 
 * Copyright 2015 <+YOU OR YOUR COMPANY+>.
 * 
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 * 
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifndef INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_IMPL_H
#define INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_IMPL_H

#include <frame_detection/deinterleaver_bb.h>

namespace gr {
  namespace frame_detection {

    class deinterleaver_bb_impl : public deinterleaver_bb
    {
     private:
        int i_n;
        int i_m;
        int counter;
        int n_count;
        int m_count;
        char* buffer;
        char* buffer2;
        int buf_count;
        bool frame_detected;
        bool end_of_frame;
        int eof_pos;
        int m_length;

     public:
      deinterleaver_bb_impl(int n, int m, int message_length);
      ~deinterleaver_bb_impl();

      // Where all the action really happens
      void forecast (int noutput_items, gr_vector_int &ninput_items_required);

      int general_work(int noutput_items,
		       gr_vector_int &ninput_items,
		       gr_vector_const_void_star &input_items,
		       gr_vector_void_star &output_items);
    };

  } // namespace frame_detection
} // namespace gr

#endif /* INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_IMPL_H */

