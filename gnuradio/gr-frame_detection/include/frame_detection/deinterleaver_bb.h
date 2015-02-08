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


#ifndef INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_H
#define INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_H

#include <frame_detection/api.h>
#include <gnuradio/block.h>

namespace gr {
  namespace frame_detection {

    /*!
     * \brief <+description of block+>
     * \ingroup frame_detection
     *
     */
    class FRAME_DETECTION_API deinterleaver_bb : virtual public gr::block
    {
     public:
      typedef boost::shared_ptr<deinterleaver_bb> sptr;

      /*!
       * \brief Return a shared_ptr to a new instance of frame_detection::deinterleaver_bb.
       *
       * To avoid accidental use of raw pointers, frame_detection::deinterleaver_bb's
       * constructor is in a private implementation
       * class. frame_detection::deinterleaver_bb::make is the public interface for
       * creating new instances.
       */
      static sptr make(int n, int m);
    };

  } // namespace frame_detection
} // namespace gr

#endif /* INCLUDED_FRAME_DETECTION_DEINTERLEAVER_BB_H */

