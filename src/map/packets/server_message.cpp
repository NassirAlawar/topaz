﻿/*
===========================================================================

  Copyright (c) 2010-2015 Darkstar Dev Teams

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see http://www.gnu.org/licenses/

===========================================================================
*/

#include "../../common/socket.h"
#include "server_message.h"

#include <string.h>

CServerMessagePacket::CServerMessagePacket(const string_t message, int8 language, int32 timestamp, int32 message_offset)
{
    this->type = 0x4D;
    this->size = 0x0E;

    ref<uint8>(0x04) = message_offset == 0 ? 1 : 2;
    ref<uint8>(0x05) = 1;
    ref<uint8>(0x06) = 1;
    ref<uint8>(0x07) = language;
    ref<uint32>(0x08) = (uint32)(timestamp == 0 ? time(0) : timestamp);
    ref<uint32>(0x0C) = 0; // Message Length.. (Total)
    ref<uint32>(0x10) = 0; // Message Offset..
    ref<uint32>(0x14) = 0; // Message Length..

    // Ensure we have a message and the requested offset is not outside of the bounds..
    if (message.length() > (size_t)0 && message.length() > (size_t)message_offset)
    {
        auto msgLength = message.length();
        auto sndLength = (msgLength - message_offset) > 236 ? 236 : (msgLength - message_offset);

        ref<uint32>(0x0C) = (uint32)message.length(); // Message Length.. (Total)
        ref<uint32>(0x10) = message_offset;   // Message Offset..
        ref<uint32>(0x14) = (uint32)sndLength;        // Message Length..

        memcpy((data + (0x18)) , message.c_str() + message_offset, sndLength);

        auto textSize = (uint8)(sndLength + sndLength % 2);
        this->size = ((((0x14 + textSize) + 4) >> 1) & 0xFE);
    }
}
