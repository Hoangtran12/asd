import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

export default async function Home() {
  const cars = await prisma.vehicle.findMany();

  return (
    <div>
      <h1>Car Listings</h1>
      <ul>
        {cars.map((vehicle) => (
          <li key={vehicle.vinnum}>{vehicle.year} - {vehicle.make}  {vehicle.model}</li>
        ))}
      </ul>
    </div>
  );
}
