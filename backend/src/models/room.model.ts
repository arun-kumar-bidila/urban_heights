import mongoose, { Schema, Document, Model } from "mongoose";

export interface IRoom {
  roomNumber: string;
  roomType: string;
  rent: number;
  rentStatus: boolean;
  apartmentId: mongoose.Types.ObjectId;
  vacant: boolean;
  createdAt: Date;
  updateAt: Date;
}

const roomSchema: Schema<IRoom> = new Schema(
  {
    roomNumber: {
      type: String,
      required: true,
      trim: true,
    },
    roomType: {
      type: String,
      required: true,
      trim: true,
    },
    rent: {
      type: Number,
      required: true,
      trim: true,
    },
    apartmentId: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Apartment",
      required: true,
    },
    vacant: {
      type: Boolean,
      default: true,
    },
    rentStatus: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  },
);

const Room: Model<IRoom> = mongoose.model("Room", roomSchema);

export default Room;
