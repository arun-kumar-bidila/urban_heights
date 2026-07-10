import { Schema, Model, Document } from "mongoose";
import mongoose from "mongoose";

export interface IApartment {
  apartmentCode: string;
  apartmentName: string;
  address: string;
  ownerName: string;
  ownerMobile: string;
  ownerCode: string;
  password: string;
  createdAt: Date;
  updatedAt: Date;
}

const ApartmentSchema: Schema<IApartment> = new Schema<IApartment>(
  {
    apartmentCode: {
      type: String,
      required: true,
      trim: true,
      unique: true,
    },
    apartmentName: {
      type: String,
      required: true,
      trim: true,
    },
    address: {
      type: String,
      required: true,
      trim: true,
    },
    ownerName: {
      type: String,
      required: true,
      trim: true,
    },
    ownerMobile: {
      type: String,
      required: true,
      trim: true,
    },
    ownerCode: {
      type: String,
      required: true,
      trim: true,
    },
    password: {
      type: String,
      require: true,
      trim: true,
    },
  },
  {
    timestamps: true,
  },
);

const Apartment: Model<IApartment> = mongoose.model(
  "Apartment",
  ApartmentSchema,
);

export default Apartment;
